//
//  PaymentSummaryView.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 27.06.2022.
//

import SwiftUI

struct PaymentSummaryView: View {
    let isVatIncluded: Bool
    let priceValue: Decimal
    let currency: String

    private let numberFormatter = { () -> NumberFormatter in
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        return formatter
    }()

    var body: some View {
        cardBackground
            .overlay(alignment: .topLeading) {
                logo
            }
            .overlay(alignment: .bottomLeading) {
                price
            }
            .frame(height: UIScheme.dimension.infoCardHeight)
    }

    var cardBackground: some View {
        IR.infoCardBackground.image?.resizable()
            .mask(
                Color.red
                    .frame(height: UIScheme.dimension.infoCardHeight)
                    .cornerRadius(UIScheme.dimension.backgroundSheetCornerRadius,
                                  corners: .allCorners)
            )
    }

    var logo: some View {
        IR.paymentInfoLogo.image?
            .padding([.top, .leading], UIScheme.dimension.middleSpacing)
    }

    var price: some View {
        VStack(alignment: .leading, spacing: UIScheme.dimension.smallSpacing){
            HStack(alignment: .firstTextBaseline, spacing: UIScheme.dimension.valueToCurrencySpacing) {
                Text("\(priceValue as NSDecimalNumber, formatter: self.numberFormatter)")
                .font(UIScheme.font.priceValueFont)
                Text(currency).font(UIScheme.font.priceCurrencyFont)
            }
            vat
        }
        .foregroundColor(UIScheme.color.paymentInfoCardForegroundColor)
        .padding([.bottom, .leading], UIScheme.dimension.paymentDetailsSpacing)
    }

    var vat: some View {
        Text("Total Price ").font(UIScheme.font.commonSemiBold) +
        Text(isVatIncluded ? "(VAT included)" : "").font(UIScheme.font.commonRegular)

    }
}

struct PaymentSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentSummaryView(isVatIncluded: true,  priceValue: Decimal(238.50), currency: "EUR")
    }
}

