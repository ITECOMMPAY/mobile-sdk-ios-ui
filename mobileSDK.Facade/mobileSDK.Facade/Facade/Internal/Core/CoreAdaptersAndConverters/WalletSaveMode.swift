//
//  WalletSaveMode.swift
//  mobileSDK.Facade
//
//  Created by Artem Serebrennikov on 15.03.2023.
//

#if !DEVELOPMENT
@_implementationOnly import MsdkCore
@_implementationOnly import mobileSDK_UI
#else
import MsdkCore
import mobileSDK_UI
#endif

extension mobileSDK_UI.WalletSaveMode {
    static func createFrom(_ coreEnum: MsdkCore.WalletSaveMode) -> mobileSDK_UI.WalletSaveMode {
        switch coreEnum {
        case .neverSaveCustomerPaymentData: return .never
        case .alwaysSaveCustomerPaymentData: return .always
        default: return .askCustomer
        }
    }
}
