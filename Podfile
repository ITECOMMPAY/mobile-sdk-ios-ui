# Uncomment the next line to define a global platform for your project
platform :ios, '15.6'
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

mSDKTargets = ["ecommpaySDK", "ecommpaySDK_Dev"]
for targetName in mSDKTargets
  target targetName do
    project './mobileSDK.Facade/mobileSDK.Facade.xcodeproj'
    pod 'MsdkCore', :path => './MSDKCore/MsdkCore.podspec'
  end
end

#post_install do |installer|
#
#    installer.pods_project.targets.each do |target|
#        target.build_configurations.each do |config|
#           config.build_settings['OTHER_SWIFT_FLAGS'] ||= ['$(inherited)']
#           config.build_settings['OTHER_SWIFT_FLAGS'] << '-enable-experimental-feature AccessLevelOnImport'
#        end
#    end
#
#end
