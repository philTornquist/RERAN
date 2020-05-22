#!/bin/bash

DEVICE_ABI=$(adb shell getprop ro.product.cpu.abi)
DEVICE_API_LEVEL=$(adb shell getprop ro.build.version.sdk)
CMAKE_VERSION=$(find ${ANDROID_HOME}/cmake/  ! -path ${ANDROID_HOME}/cmake/  -maxdepth 1 -type d)

#check if cmake is installed
test -z ${CMAKE_VERSION} && echo "CMAKE not installed: visit https://developer.android.com/studio/projects/install-ndk in order to properly install this tool" && exit 1

mkdir -p build
cd build
${CMAKE_VERSION}/bin/cmake ../ -DCMAKE_TOOLCHAIN_FILE=${ANDROID_HOME}/ndk-bundle/build/cmake/android.toolchain.cmake -DANDROID_ABI=${DEVICE_ABI} -DANDROID_NATIVE_API_LEVEL=${DEVICE_API_LEVEL}
cd ../src
javac Translate.java 
jar cvf0m ../build/RERANTranslate.jar ../manifest.txt  Translate.class
cd ..