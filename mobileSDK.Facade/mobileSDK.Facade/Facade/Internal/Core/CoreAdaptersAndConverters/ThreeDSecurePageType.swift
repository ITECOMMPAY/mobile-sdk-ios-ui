//
//  ThreeDSecurePageType.swift
//  mobileSDK.Facade
//
//  Created by Artem Serebrennikov on 27.12.2022.
//

#if !DEVELOPMENT
@_implementationOnly import MsdkCore
@_implementationOnly import mobileSDK_UI
#else
import MsdkCore
import mobileSDK_UI
#endif

extension mobileSDK_UI.ThreeDSecurePageType {
    static func createFrom(_ coreEnum: MsdkCore.ThreeDSecurePageType) -> mobileSDK_UI.ThreeDSecurePageType {
        switch coreEnum {
        case .threeDs2Frictionless: return .THREE_DS_2_FRICTIONLESS
        case .threeDs2Challenge: return .THREE_DS_2_CHALLENGE
        default: return .THREE_DS_1
        }
    }
}
