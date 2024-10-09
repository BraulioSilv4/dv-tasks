#!/bin/bash

set -e 

source /opt/ros/humble/setup.bash
cd /root/ros2_ws
colcon build 
source /root/ros2_ws/install/setup.bash
# ros2 run recrutas_tarefa hello_world

exec "$@" /bin/bash