//
//  PaymentDetailData.swift
//  mobileSDK.UI
//
//  Created by Artem Serebrennikov on 01.02.2023.
//

import Foundation

public struct PaymentDetailData {
    public init(title: L, description: String, canBeCopied: Bool) {
        self.title = title
        self.description = description
        self.canBeCopied = canBeCopied
    }

    let title: L
    let description: String
    let canBeCopied: Bool
}
