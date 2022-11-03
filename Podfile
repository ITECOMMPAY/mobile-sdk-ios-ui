# Uncomment the next line to define a global platform for your project
platform :ios, '14.0'
#use_frameworks!
use_modular_headers!
workspace 'mobileSDK.xcworkspace'

#TestClient

TestClientTargets = ["EcommpaySample"]

for targetName in TestClientTargets
  target targetName do
    project './mobileSDK.SampleApp/mobileSDK.SampleApp.xcodeproj'
    pod 'AppCenter'
  end
end

#mSDK iOS

mSDKTargets = ["ecommpaySDK"]
mSDKTargetsDev = mSDKTargets.collect { |x| x + "_Dev" }
mSDKTargets += mSDKTargetsDev
for targetName in mSDKTargets
  target targetName do
    project './mobileSDK.Facade/mobileSDK.Facade.xcodeproj'
    pod 'MsdkCore', '0.5.3'
  end
end
