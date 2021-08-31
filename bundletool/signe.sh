#!/bin/bash

UNSIGNED_AAB_NAME="output/app_unsigned.aab"    #未签名的aab文件名
SIGNED_AAB_NAME="output/app_signed.aab"        #已签名的aab文件名
KEYSTORE_FILE_NAME="packcheng.keystore" #签名文件名
KEYSTORE_PWD="123456789"
KEY_ALIAS="packcheng"
KEY_PWD="123456789"

currentDir=$(pwd)
echo "当前目录为：$currentDir"

echo "移除之前已签名的aab文件"
rm -f "$currentDir/$SIGNED_AAB_NAME"

echo "准备开始签名"
jarsigner -digestalg SHA1 -sigalg SHA1withRSA \
  -keystore "$currentDir/$KEYSTORE_FILE_NAME" \
  -storepass "$KEYSTORE_PWD" \
  -keypass "$KEY_PWD" \
  -signedjar "$currentDir/$SIGNED_AAB_NAME" "$currentDir/$UNSIGNED_AAB_NAME" "$KEY_ALIAS"
