#!/bin/bash
SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
source $SCRIPT_DIR/../install/setup.bash 
source $SCRIPT_DIR/../../autoware-robobus/install/setup.bash 

function print_help() {
  echo "启动传感器"
  echo ""
  echo "Usage:"
  echo "  ./sensing.sh [-robot_state] [-camera_type] [-verify]"
  echo ""
  echo "    - robot_state : 启动传感器是否发布tf树"
  echo "    - camera_type : flir相机或者森云相机"
  echo "    - verify : 标定完成后验证tf"
  echo ""
}

robot_state="${1:-true}"
camera_type="${2:-sensing}"

ros2 launch robobus_sensor_kit_calibration sensing_all.launch.xml robot_state:=$robot_state camera_type:=$camera_type