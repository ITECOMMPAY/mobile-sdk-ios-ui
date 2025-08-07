//
//  RecipientInfoScreen.swift
//  EcommpaySample
//
//  Created by Artem Serebrennikov on 09.01.2023.
//

import Foundation
import SwiftUI

struct RecipientData {
    var walletId: String?
    var walletOwner: String?
    var pan: String?
    var cardHolder: String?
    var country: String?
    var stateCode: String?
    var city: String?
    var address: String?
}

struct RecipientInfoScreen: View {
    @Binding var recipientInfo: RecipientData

    var body: some View {
        Form {
            Section {
                FieldWithLabel(label: "Wallet ID") {
                    TextField("Wallet ID", text: $recipientInfo.walletId.flatten())
                }
                FieldWithLabel(label: "Wallet owner") {
                    TextField("Wallet owner", text: $recipientInfo.walletOwner.flatten())
                }
                FieldWithLabel(label: "Pan") {
                    TextField("Pan", text: $recipientInfo.pan.flatten())
                }
                FieldWithLabel(label: "Card holder") {
                    TextField("Card holder", text: $recipientInfo.cardHolder.flatten())
                }
                FieldWithLabel(label: "Country") {
                    TextField("Country", text: $recipientInfo.country.flatten())
                }
                FieldWithLabel(label: "State code") {
                    TextField("State code", text: $recipientInfo.stateCode.flatten())
                }
                FieldWithLabel(label: "City") {
                    TextField("City", text: $recipientInfo.city.flatten())
                }
                FieldWithLabel(label: "Address") {
                    TextField("Address", text: $recipientInfo.address.flatten())
                }
            }
        }
        .toolbar {
            HStack {
                Button("Clear") {
                    recipientInfo.walletId = nil
                    recipientInfo.walletOwner = nil
                    recipientInfo.pan = nil
                    recipientInfo.cardHolder = nil
                    recipientInfo.country = nil
                    recipientInfo.stateCode = nil
                    recipientInfo.city = nil
                    recipientInfo.address = nil
                }
            }
        }
        .navigationTitle("Recipient Info")
    }
}


#if DEBUG

struct RecipientInfoScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RecipientInfoScreen(recipientInfo: .mutable(RecipientData()))
        }

    }
}

#endif
