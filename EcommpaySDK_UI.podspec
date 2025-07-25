#
#  Be sure to run `pod spec lint paymentpage-sdk-ios.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|
  spec.name         = "EcommpaySDK_UI"
  spec.version      = "3.8.6"
  spec.summary      = "Ecommpay SDK with UI for iOS"

  spec.description  = "SDK for iOS is a software development kit for fast integration of the ECommPay payment solutions right in your mobile app for iOS."
  spec.homepage     = "https://github.com/ITECOMMPAY/mobile-sdk-ios-ui"
  spec.license      = "MIT"
 
  spec.authors      = { "Alexey Khrameev"  =>  "a.khrameev@it.ecommpay.com",
                        "Artem Serebrennikov"  =>  "a.serebrennikov@it.ecommpay.com" }

  spec.platform     = :ios
  spec.ios.deployment_target = "15.6"

  spec.source       = { :http => "https://github.com/ITECOMMPAY/mobile-sdk-ios-ui/releases/download/#{spec.version}/ecommpaySDK.xcframework.zip" }

  spec.ios.vendored_frameworks = 'ecommpaySDK.xcframework'

end
