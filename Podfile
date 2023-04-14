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
    pod 'MsdkCore', '0.8.9'
    pod 'KSCrash', :git => 'https://github.com/ECOMMPAY/KSCrash.git'
  end
end
