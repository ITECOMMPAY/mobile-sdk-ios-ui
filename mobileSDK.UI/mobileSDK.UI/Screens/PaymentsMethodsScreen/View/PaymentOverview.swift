//
//  PaymentOverview.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 27.06.2022.
//

import SwiftUI

struct PaymentOverview: View {
    let isVatIncluded: Bool
    let priceValue: Decimal
    let currency: String
    let recurringData: [RecurringDetailsData]
    let paymentDetails: [PaymentDetailData]
    let backgroundTemplate: InfoCardBackground
    let logoImage: Image?
    var isDimBackground: Bool = false

    private let numberFormatter = { () -> NumberFormatter in
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        return formatter
    }()

    var body: some View {
        VStack(alignment: .leading, spacing: UIScheme.dimension.paymentOverviewSpacing) {
            logo
            if !recurringData.isEmpty { recurringDetails }
            price
            if !paymentDetails.isEmpty { details }
        }.frame(maxWidth: .infinity, alignment: .topLeading)
        .padding(UIScheme.dimension.paymentOverviewSpacing)
        .background() {
            cardBackground.opacity(isDimBackground ? 0.4 : 1)
        }
    }

    var cardBackground: some View {
        backgroundTemplate.image?.resizable()
            .colorMultiply(UIScheme.color.brandColor)
            .cornerRadius(UIScheme.dimension.backgroundSheetCornerRadius,
                          corners: .allCorners)
            .accessibilityHidden(true)
    }

    var logo: some View {
        logoImage
    }

    var price: some View {
        VStack(alignment: .leading, spacing: UIScheme.dimension.tinySpacing) {
            HStack(alignment: .firstTextBaseline, spacing: UIScheme.dimension.valueToCurrencySpacing) {
                Text("\(priceValue as NSDecimalNumber, formatter: self.numberFormatter)")
                    .font(UIScheme.font.commonBold(size: UIScheme.dimension.hugeFont))
                Text(currency).font(UIScheme.font.commonRegular(size: UIScheme.dimension.middleFont))
            }
            .accessibilityElement(children: .combine)
            vat
        }
        .foregroundColor(UIScheme.color.paymentInfoCardForegroundColor)
    }

    var vat: some View {
        Text(L.title_total_price.string + " ")
            .font(UIScheme.font.commonSemiBold(size: UIScheme.dimension.smallFont))
        + Text(isVatIncluded ? L.vat_included.string : "")
            .font(UIScheme.font.commonRegular(size: UIScheme.dimension.smallFont))
    }
    
    var details: some View {
        PaymentDetailsView(details: paymentDetails)
    }

    var recurringDetails: some View {
        RecurringDetailsView(details: recurringData)
    }
}

#if DEBUG
struct PaymentSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentOverview(
            isVatIncluded: true,
            priceValue: Decimal(238.50),
            currency: "EUR",
            recurringData: [
                RecurringDetailsData(
                    title: L.recurring_start_date,
                    description: .value("November 19, 2022")
                )
            ],
            paymentDetails: [
                PaymentDetailData(title: L.title_payment_id,
                                  description: "EP2e11-f018-RQR12-26VL-0412CS",
                                  canBeCopied: true),
                PaymentDetailData(title: L.title_payment_information_description,
                                  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                                  canBeCopied: false)
            ],
            backgroundTemplate: .lines,
            logoImage: IR.applePayButtonLogo.image,
            isDimBackground: true
        ).padding().previewLayout(.sizeThatFits)
    }
}
#endif
