#!/usr/bin/env bash

cd /Users/buddybuild/workspace

if [ -z ${PLATFORM+x} ]; then
  echo '=== Detected environmental variable PLATFORM is set: $PLATFORM'
  cordova prepare $PLATFORM
else
  echo '=== Could not detect environmental variable PLATFORM. cordova prepare both ios and android. PLATFORM: $PLATFORM'
  cordova prepare android ios
fi
