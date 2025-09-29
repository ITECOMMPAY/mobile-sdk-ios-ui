//
//  PaymentOverview.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 27.06.2022.
//

import SwiftUI

struct PaymentOverview: View {
    let priceValue: Decimal
    let currency: String
    let recurringData: [RecurringDetailsData]
    let paymentDetails: [PaymentDetailData]
    let logoImage: Image?
    var isDimBackground: Bool = false

    private let numberFormatter = { () -> NumberFormatter in
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.decimalSeparator = "."
        return formatter
    }()

    var body: some View {
        VStack(
            alignment: .leading,
            spacing: UIScheme.dimension.paymentOverviewSpacing
        ) {
            HStack {
                logo
                Spacer()
                IR.flag.image
                Text(Locale.current.threeLetterLanguageCode())
                    .font(.custom(.primary(size: .s, weight: .semiBold)))
                    .foregroundColor(UIScheme.color.buttonCard)
            }
            if !recurringData.isEmpty { recurringDetails }
            VStack(
                alignment: .leading,
                spacing: 6
            ) {
                price
                if !paymentDetails.isEmpty { details }
            }
        }
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .padding(UIScheme.dimension.paymentOverviewSpacing)
        .background {
            cardBackground.opacity(isDimBackground ? 0.4 : 1)
        }
    }

    var cardBackground: some View {
        UIScheme.color.brandPrimary
            .overlay(
                IR.cardBackgroundPattern.image?
                    .resizable(resizingMode: .tile)
                    .foregroundColor(.white)
            )
            .clipShape(
                .rect(
                    topLeadingRadius: UIScheme.dimension.backgroundSheetCornerRadius,
                    bottomLeadingRadius: UIScheme.dimension.backgroundSheetCornerRadius,
                    bottomTrailingRadius: UIScheme.dimension.backgroundSheetCornerRadius,
                    topTrailingRadius: UIScheme.dimension.backgroundSheetCornerRadius
                )
            )
            .accessibilityHidden(true)
    }

    var logo: some View {
        logoImage ?? IR.ecommpayLogo.image
    }

    var price: some View {
        VStack(alignment: .leading, spacing: UIScheme.dimension.tinySpacing) {
            Text("\(currency) \(priceValue as NSDecimalNumber, formatter: self.numberFormatter)")
                .font(.custom(.secondary(size: .xxl, weight: .bold)))
        }
        .foregroundColor(UIScheme.color.buttonCard)
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
            priceValue: Decimal(238.50),
            currency: "EUR",
            recurringData: [
                RecurringDetailsData(
                    title: L.recurring_start_date,
                    description: .value("November 19, 2022")
                )
            ],
            paymentDetails: [
                PaymentDetailData(
                    title: L.title_payment_id,
                    description: "EP2e11-f018-RQR12-26VL-0412CS",
                    canBeCopied: true
                ),
                PaymentDetailData(
                    title: L.title_payment_information_description,
                    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                    canBeCopied: false
                )
            ],
            logoImage: IR.applePayButtonLogo.image,
            isDimBackground: true
        ).padding().previewLayout(.sizeThatFits)
    }
}
#endif
