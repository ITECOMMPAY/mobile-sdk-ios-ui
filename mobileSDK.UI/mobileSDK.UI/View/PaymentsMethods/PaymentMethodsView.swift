//
//  PaymentMethodsView.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 27.06.2022.
//

import SwiftUI

struct PaymentMethodsView: View {
    
    var body: some View {
        BottomCardView {
            VStack(alignment: .leading, spacing: UIScheme.dimension.middleSpacing) {
                HStack(alignment: .center){
                    ScreenHeader(text: L.title_payment_methods.string)
                    Spacer()
                    CloseButton()
                }
                .frame(maxWidth: .infinity)
                PaymentDetailsView()
                PaymentSummaryView(isVatIncluded: true, priceValue: 238.50, currency: "EUR")
                ApplePayButton()
            }.padding([.trailing, .leading, .top], UIScheme.dimension.largeSpacing)
        } content: {
            VStack {
                CompatibleVStack(spacing: UIScheme.dimension.smallSpacing)  {
                    PaymentMethodCell(methodTitle: "**** 3456", methodImage: IR.visa.image, content: Color.green.frame(height: 200), isSavedAccount: true, isExpanded: true)
                    PaymentMethodCell(methodTitle: "Bank Card", methodImage: IR.bankCard.image, content: Color.red.frame(height: 100), isSavedAccount: true, isExpanded: false)
                    PaymentMethodCell(methodTitle: "Neteller", methodImage: IR.neteller.image, content: Color.blue.frame(height: 50), isSavedAccount: true, isExpanded: false)

                    FooterView().padding(.bottom, UIScheme.dimension.largeSpacing)
                }.padding([.trailing, .leading], UIScheme.dimension.largeSpacing)
            }.padding(.top, UIScheme.dimension.middleSpacing)
        }
    }
}

struct PaymentMethodsView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentMethodsView()
    }
}
