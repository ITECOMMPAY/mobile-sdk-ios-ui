Pod::Spec.new do |spec|
    spec.name                     = 'MsdkCore'
    spec.version                  = '0.13.2'
    spec.homepage                 = '/paymentpage-sdk-ios-core'
    spec.source                   = { :http => '/paymentpage-sdk-ios-core/releases/download/0.13.2/MsdkCore.xcframework.zip' }
    spec.authors                  = { '' => '' }
    spec.license                  = 'MIT'
    spec.summary                  = 'Payment msdk core module'
    spec.vendored_frameworks      = 'MsdkCore.xcframework'
    spec.libraries                = 'c++'
    spec.ios.deployment_target = '15.6'
                
                
                
                
                
end