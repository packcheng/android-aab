#!/bin/bash
AAB_NAME="app.aab"
APKS_NAME="app.apks"
BUNDLE_JAR="bundletool.jar"
KS_STORE="packcheng.keystore"
KEY_ALIAS="packcheng"
KS_PASS="123456789"
KEY_PASS="123456789"

currentDir=$(pwd)

echo "移除之前生成的apks"
rm -f "$currentDir/$APKS_NAME"

echo "准备生成连接设备的apks"
java -jar "$currentDir/$BUNDLE_JAR" build-apks --connected-device --bundle="$currentDir/$AAB_NAME" --output="$currentDir/$APKS_NAME" --ks="$currentDir/$KS_STORE" --ks-pass=pass:$KS_PASS --ks-key-alias=$KEY_ALIAS --key-pass=pass:$KEY_PASS

echo "准备安装apks"
java -jar "$currentDir/$BUNDLE_JAR" install-apks --apks="$currentDir/$APKS_NAME"