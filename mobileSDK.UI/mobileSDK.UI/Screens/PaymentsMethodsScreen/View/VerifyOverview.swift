//
//  VerifyOverview.swift
//  mobileSDK.UI
//
//  Created by Artem Serebrennikov on 24.01.2023.
//

import SwiftUI

struct VerifyOverview: View {
    let paymentID: String?
    let paymentDescription: String?
    let recurringData: [RecurringDetailsData]
    let logoImage: Image?

    var body: some View {
        VStack(alignment: .leading, spacing: UIScheme.dimension.paymentOverviewSpacing) {
            logo
            
            if !recurringData.isEmpty {
                recurringDetails
            }
            
            paymentIDView
            
            details
        }
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .padding(UIScheme.dimension.paymentOverviewSpacing)
        .background(cardBackground)
    }

    var recurringDetails: some View {
        RecurringDetailsView(details: recurringData)
    }
    
    @ViewBuilder
    var paymentIDView: some View {
        if let paymentID = paymentID {
            VStack(alignment: .leading, spacing: UIScheme.dimension.tinySpacing) {
                Text(L.title_payment_id.string)
                    .font(.custom(.primary(size: .xs, weight: .regular)))
                    .foregroundColor(UIScheme.color.buttonCard)
                Text(paymentID)
                    .font(.custom(.primary(size: .s, weight: .bold)))
                    .foregroundColor(UIScheme.color.buttonCard)
            }
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder
    private var details: some View {
        if let paymentDescription = paymentDescription {
            PaymentDetailsView(
                details: [
                    .init(
                        title: L.title_payment_information_description,
                        description: paymentDescription,
                        canBeCopied: false
                    )
                ]
            )
        } else {
            EmptyView()
        }
    }
    
    private var logo: some View {
        logoImage?
            .renderingMode(.template)
            .foregroundStyle(UIScheme.color.buttonCard)
        ?? IR.ecommpayLogo.image?
            .renderingMode(.template)
            .foregroundStyle(UIScheme.color.buttonCard)
    }
    
    private var cardBackground: some View {
        UIScheme.color.brandPrimary
            .overlay(
                IR.cardBackgroundPattern.image?
                    .renderingMode(.template)
                    .resizable(resizingMode: .tile)
                    .foregroundColor(UIScheme.isDarkTheme ? .black : .white)
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
}

#if DEBUG

struct VerifyOverview_Previews: PreviewProvider {
    static var previews: some View {
        VerifyOverview(
            paymentID: "EP2e11-f018-RQR12-26VL-0412CS",
            paymentDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
            recurringData: [
                RecurringDetailsData(
                    title: L.recurring_start_date,
                    description: .value("November 19, 2022")
                )
            ],
            logoImage: IR.applePayButtonLogo.image
        )
        .padding()
        .previewLayout(.sizeThatFits)
    }
}

#endif
