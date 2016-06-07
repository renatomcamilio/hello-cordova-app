#!/usr/bin/env bash

cd /Users/buddybuild/workspace
echo '=== Start to run : npm install npm -g'
npm install npm -g

echo '=== Install cordova'
npm install -g cordova

echo '=== Start to run : npm install'
npm install

echo '=== Start to run : cordova check requirements'
cordova requirements

echo '=== Start to run : cordova add platforms'
cordova platform add android ios

echo '=== Start to run : cordova prepare platforms'
cordova prepare android ios

echo '=== Start to run : cp buddybuild_prebuild to ios platform'
cp ./buddybuild_prebuild.sh ./platforms/ios
echo '=== Start to run : cp buddybuild_prebuild to android platform'
cp ./buddybuild_prebuild.sh ./platforms/android
echo '=== Start to run : cp ./build_extra.gradle to android platform'
cp ./build-extras.gradle ./platforms/android

echo '=== Start to run : cordova compile platforms'
cordova compile android ios

echo '=== Start to run : env'
env

if hash android 2>/dev/null; then
    echo '=== Detected android command, run android list sdk --all'
    android list sdk --all
fi
