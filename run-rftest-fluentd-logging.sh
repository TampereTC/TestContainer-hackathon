#!/bin/sh
echo "--------------------"
echo "--- New folder -----"
echo "-- ~/vol/robot/ ----"
echo "-~/vol/robot-results"
echo "--------------------"

if [ ! -d ~/vol/robot/ ]; then
    mkdir -p ~/vol/robot/ 
fi

if [ ! -d ~/vol/robot-results/ ]; then
    mkdir -p ~/vol/robot-results 
fi

echo "--------------------"
echo "--- Clean old ......"
echo "--- and copy  ......"
echo "--- new test  ......"
echo "--------------------"

rm -rf ~/vol/robot/* && cp -r ~/hackstack/docker-robot-framework/sample_vol/* ~/vol/robot/

echo "----------------------"
echo "--- Add authority ----"
echo "----------------------"

xhost + local:docker

echo "----------------------"
echo "--- Create network ---"
echo "----------------------"

docker network create -d bridge hackstack-robot

echo "--------------------------"
echo "--- Run docker target ----"
echo "-- with fluentd logging --"
echo "--------------------------"

docker run -d --rm \
           --net hackstack-robot \
           -p 8000:80 \
           -v ~/vol/robot/robot_target:/opt/web \
           --name robot-framework-target \
           --log-driver=fluentd --log-opt fluentd-address=localhost:24224 --log-opt tag=httpd.access \
           playniuniu/robot-framework-target

sleep 2

echo "-------------------------"
echo "--- Run docker robot ----"
echo "-------------------------"

docker run --rm -t \
           --net hackstack-robot \
           -e DISPLAY=unix$DISPLAY \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
           -v ~/vol/robot/robot_testcases:/testcases \
           -v ~/vol/robot-results:/results \
           --name robot-framework \
           playniuniu/robot-framework

sleep 3

echo "------------------"
echo "--- Tear down ----"
echo "------------------"

docker stop robot-framework-target && docker network rm hackstack-robot

echo "----------------------"
echo "--- Test complete ----"
echo "----------------------"
