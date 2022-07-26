//
//  SavedCardCheckoutView.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 11.07.2022.
//

import SwiftUI

struct SavedCardCheckoutView: View {
    let paymentAmount: Decimal
    let paymentCurrency: String
    let savedCard: SavedAccount?

     @State private var cvvText: String = ""
     @State private var isValid: Bool = false

    var payAction: (_ cvvText: String) -> Void
    var deleteCardAction: () -> Void

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: UIScheme.dimension.formSmallSpacing) {
                dateField
                cvvField
            }
            .padding(.top, UIScheme.dimension.formSmallSpacing)
            .padding(.bottom, UIScheme.dimension.formLargeVerticalSpacing)

            PayButton(label: PayButtonLabel(style: .Pay(paymentAmount, currency: paymentCurrency)),
                      disabled: !isValid) {
                payAction(cvvText)
            }
            .disabled(!isValid)
            .padding(.bottom, UIScheme.dimension.middleSpacing)

            LinkButton(text: L.button_delete.string,
                       fontSize: UIScheme.dimension.smallFont,
                       foregroundColor: UIScheme.color.deleteCardButtonColor,
                       onTap: deleteCardAction)
            .padding(.bottom, UIScheme.dimension.formLargeVerticalSpacing)
        }.padding([.leading, .trailing], UIScheme.dimension.middleSpacing)
    }

    var dateField: some View {
        ExpiryField(disabled: true, expiryString: .constant(savedCard?.savedCardExpiry?.stringValue ?? ""), isValid: .constant(true))
    }

    var cvvField: some View {
        CvvField(showValidation: false, cvv: $cvvText, isValid: $isValid)
    }
}

#if DEBUG
// TODO: repare preview
/*
struct SavedCardCheckoutView_Previews: PreviewProvider {
    static var previews: some View {


        SavedCardCheckoutView.init(paymentAmount: 100.50, paymentCurrency: "RUB", savedCard: nil, expiryString: "12/24")
            .previewLayout(.sizeThatFits)

    }
}
 */
#endif
