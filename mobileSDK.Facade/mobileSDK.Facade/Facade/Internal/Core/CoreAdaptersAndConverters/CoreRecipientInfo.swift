//
//  CoreRecipientInfo.swift
//  mobileSDK.Facade
//
//  Created by Artem Serebrennikov on 03.01.2023.
//

import Foundation

#if !DEVELOPMENT
internal import MsdkCore
internal import mobileSDK_UI
#else
import MsdkCore
import mobileSDK_UI
#endif

extension mobileSDK_UI.RecipientInfo {
    var coreRecipientInfo: MsdkCore.RecipientInfo {
        .init(
            walletOwner: walletOwner,
            walletId: walletId,
            country: country,
            pan: pan,
            cardHolder: cardHolder,
            address: address,
            city: city,
            stateCode: stateCode,
            firstName: nil,
            lastName: nil
        )
    }
}
