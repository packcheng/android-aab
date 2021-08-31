#!/bin/bash
AAB_NAME="output/release.aab"
APKS_NAME="output/app_config.apks"
BUNDLE_JAR="bundletool.jar"
KS_STORE="packcheng.keystore"
KEY_ALIAS="packcheng"
KS_PASS="123456789"
KEY_PASS="123456789"
DEVICE_SPEC_FILE_NAME="output/device-spec.json"

currentDir=$(pwd)

if [ ! -e "$currentDir/$DEVICE_SPEC_FILE_NAME" ]; then
    echo "$currentDir/$DEVICE_SPEC_FILE_NAME 文件不存在!!!"
    exit 1
fi

echo "移除之前基于设备配置json生成的apks"
rm -f "$currentDir/$APKS_NAME"

echo "准备生成基于设备配置json的apks"
java -jar "$currentDir/$BUNDLE_JAR" build-apks \
  --device-spec="$currentDir/$DEVICE_SPEC_FILE_NAME" \
  --bundle="$currentDir/$AAB_NAME" \
  --output="$currentDir/$APKS_NAME" \
  --ks="$currentDir/$KS_STORE" \
  --ks-pass=pass:$KS_PASS \
  --ks-key-alias=$KEY_ALIAS \
  --key-pass=pass:$KEY_PASS

echo "准备安装apks"
java -jar "$currentDir/$BUNDLE_JAR" install-apks --apks="$currentDir/$APKS_NAME"
