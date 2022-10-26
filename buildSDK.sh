#!/bin/sh

rm -rf $1.xcframework
rm -rf $1.xcframework.zip

xcodebuild archive -workspace "mobileSDK.xcworkspace" \
                   -scheme "$1" \
                   -destination "generic/platform=iOS Simulator" \
                   -archivePath "/tmp/xcf/iossimulator.xcarchive" \
                   SKIP_INSTALL=NO  \
                   BUILD_LIBRARY_FOR_DISTRIBUTION=YES | xcpretty

xcodebuild archive -workspace "mobileSDK.xcworkspace" \
                   -scheme "$1" \
                   -destination "generic/platform=iOS" \
                   -archivePath "/tmp/xcf/ios.xcarchive" \
                   SKIP_INSTALL=NO \
                   BUILD_LIBRARY_FOR_DISTRIBUTION=YES | xcpretty

xcodebuild -create-xcframework -framework /tmp/xcf/ios.xcarchive/Products/Library/Frameworks/$1.framework \
                               -framework /tmp/xcf/iossimulator.xcarchive/Products/Library/Frameworks/$1.framework \
                               -output $1.xcframework

zip -r $1.xcframework.zip $1.xcframework

