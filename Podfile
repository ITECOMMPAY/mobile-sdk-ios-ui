# Uncomment the next line to define a global platform for your project
platform :ios, '14.0'
#use_frameworks!
use_modular_headers!
workspace 'mobileSDK.xcworkspace'

#TestClient

TestClientTargets = ["EcommpaySample","EcommpaySampleNL3"]

for targetName in TestClientTargets
  target targetName do
    project './mobileSDK.SampleApp/mobileSDK.SampleApp.xcodeproj'
  end
end

#mSDK iOS

mSDKTargets = ["ecommpaySDK", "ecommpaySDK_Dev", "mSDK_UI"]
for targetName in mSDKTargets
  target targetName do
    project './mobileSDK.Facade/mobileSDK.Facade.xcodeproj'
    pod 'MsdkCore', '0.8.3'
    pod 'KSCrash', :git => 'https://github.com/ECOMMPAY/KSCrash.git'
  end
end

post_install do |installer|
  installer.pods_project.build_configurations.each do |config|
    config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
  end
end
