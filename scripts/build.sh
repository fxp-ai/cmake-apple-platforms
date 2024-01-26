#!/bin/zsh

export BUILD_DIR=_build
export INSTALL_DIR=_install

rm -rf _build _install

cmake --fresh -S . -B ${BUILD_DIR} -DCMAKE_INSTALL_PREFIX=${INSTALL_DIR}/iOS_Simulator  -DCMAKE_SYSTEM_NAME=iOS -GXcode; cmake --build ${BUILD_DIR} --config Release --target install -- -sdk iphonesimulator
cmake --fresh -S . -B ${BUILD_DIR} -DCMAKE_INSTALL_PREFIX=${INSTALL_DIR}/iOS  -DCMAKE_SYSTEM_NAME=iOS -GXcode; cmake --build ${BUILD_DIR} --config Release --target install -- -sdk iphoneos
cmake --fresh -S . -B ${BUILD_DIR} -DCMAKE_INSTALL_PREFIX=${INSTALL_DIR}/macOS "-DCMAKE_OSX_ARCHITECTURES=arm64;x86_64" -GXcode; cmake --build ${BUILD_DIR} --config Release --target install

otool -lv ${INSTALL_DIR}/iOS_Simulator/lib/libMyFramework.a | grep -A5 LC_BUILD
otool -lv ${INSTALL_DIR}/iOS/lib/libMyFramework.a | grep -A5 LC_BUILD
otool -lv ${INSTALL_DIR}/macOS/lib/libMyFramework.a | grep -A5 LC_BUILD

xcodebuild -create-xcframework -library ${INSTALL_DIR}/iOS_Simulator/lib/libMyFramework.a -headers ${INSTALL_DIR}/iOS_Simulator/include -library ${INSTALL_DIR}/iOS/lib/libMyFramework.a -headers ${INSTALL_DIR}/iOS/include -library ${INSTALL_DIR}/macOS/lib/libMyFramework.a -headers ${INSTALL_DIR}/macOS/include -output ${INSTALL_DIR}/MyFramework.xcframework
