//
//  RecipientInfo.swift
//  etoedtoSDK
//
//  Created by Ivan Krapivtsev on 13.05.2022.
//  Copyright © 2022 Etoedto. All rights reserved.
//

import Foundation

/// This data class represents additional info requered for ApplePay auth with support FT and F52 fundings
@objcMembers public final class RecipientInfo: NSObject, Codable {
    /// Wallet ID for replenishment. Field is mandatory for MasterCard.
    public var walletId: String?
    /// The owner of the replenished wallet. Always mandatory field.
    public var walletOwner: String?
    /// Recipient card number
    public var pan: String?
    /// Recipient card holder
    public var cardHolder: String?
    /// Country of recipient (wallet owner). Field is mandatory for MasterCard.
    public var country: String?
    /// Recipient state/province
    public var stateCode: String?
    /// Recipient city
    public var city: String?
    /// Recipient address
    public var address: String?

    /// Init Recipient Info
    ///
    /// - Parameters:
    ///   - walletId: Wallet ID for replenishment. Optional.
    ///   - walletOwner: The owner of the replenished wallet. Optional.
    ///   - pan: Recipient card number. Optional.
    ///   - cardHolder: Recipient card holder. Optional.
    ///   - country:  Country of recipient (wallet owner). Optional.
    ///   - stateCode: State/province of recipient. Optional.
    ///   - city: City of recipient. Optional.
    ///   - address: Address of recipient. Optional.
    @objc(initWithWalletId:walletOwner:pan:cardHolder:country:stateCode:city:address:)
    public init(
        walletId: String? = nil,
        walletOwner: String? = nil,
        pan: String? = nil,
        cardHolder: String? = nil,
        country: String? = nil,
        stateCode: String? = nil,
        city: String? = nil,
        address: String? = nil
    ) {
        self.walletId = walletId
        self.walletOwner = walletOwner
        self.pan = pan
        self.cardHolder = cardHolder
        self.country = country
        self.stateCode = stateCode
        self.city = city
        self.address = address
    }

    private enum CodingKeys: String, CodingKey {
        case walletId = "wallet_id"
        case walletOwner = "wallet_owner"
        case pan = "pan"
        case cardHolder = "card_holder"
        case country = "country"
        case stateCode = "state_code"
        case city = "city"
        case address = "address"
    }
}
