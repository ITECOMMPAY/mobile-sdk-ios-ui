# Uncomment the next line to define a global platform for your project
platform :ios, '14.0'
#use_frameworks!
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
mSDKTargetsDev = mSDKTargets.collect { |x| x + "-Dev" }
mSDKTargets += mSDKTargetsDev
for targetName in mSDKTargets
  target targetName do
    project './mobileSDK.Facade/mobileSDK.Facade.xcodeproj'
    pod 'MsdkCore', '0.4.4'
  end
end
