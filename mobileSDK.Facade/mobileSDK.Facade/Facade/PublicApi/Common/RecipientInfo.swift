//
//  RecipientInfo.swift
//  ecommpaySDK
//
//  Created by Ivan Krapivev on 13.05.2022.
//  Copyright © 2022 Ecommpay. All rights reserved.
//

import Foundation

/// This data class represents additional info requered for ApplePay auth with support FT and F52 fundings
@objcMembers public final class RecipientInfo: NSObject, Codable {
    /// The owner of the replenished wallet. Always mandatory field.
    public var walletOwner: String?
    /// Wallet ID for replenishment. Field is mandatory for MasterCard.
    public var walletId: String?
    /// Country of recipient (wallet owner). Field is mandatory for MasterCard.
    public var country: String?

    /// Init Recipient Info
    ///
    /// - Parameters:
    ///   - walletOwner: The owner of the replenished wallet. Optional.
    ///   - walletId: Wallet ID for replenishment. Optional.
    ///   - country:  Country of recipient (wallet owner). Optional.
    @objc(initWithWalletOwner:walletId:country:)
    public init(walletOwner: String? = nil, walletId: String? = nil, country: String? = nil) {
        self.walletOwner = walletOwner
        self.walletId = walletId
        self.country = country
    }
    
    private enum CodingKeys: String, CodingKey {
        case walletOwner = "wallet_owner"
        case walletId = "wallet_id"
        case country = "country"
    }
}
