#!/bin/bash

BUNDLE_JAR="bundletool.jar"
DEVICE_SPEC_FILE_NAME="output/device-spec.json"

currentDir=$(pwd)

echo "移除旧的设备配置信息"
rm -f "$currentDir/$DEVICE_SPEC_FILE_NAME"

echo "获取当前连接设备的配置信息"
java -jar "$currentDir/$BUNDLE_JAR" get-device-spec \
  --output="$currentDir/$DEVICE_SPEC_FILE_NAME"
