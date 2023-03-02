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
    let backgroundTemplate: InfoCardBackground
    let logoImage: Image?
    var isDimBackground: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: UIScheme.dimension.paymentOverviewSpacing) {
            logo
            paymentIDView
            details
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
    }

    private var logo: some View {
        logoImage
    }

    @ViewBuilder
    private var details: some View {
        if let paymentDescription = paymentDescription {
            PaymentDetailsView(details: [
                .init(
                    title: L.title_payment_information_description,
                    description: paymentDescription,
                    canBeCopied: false
                )
            ])
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder
    var paymentIDView: some View {
        if let paymentID = paymentID {
            VStack(alignment: .leading, spacing: UIScheme.dimension.tinySpacing) {
                Text(L.title_payment_id.string).font(UIScheme.font.commonRegular(size: UIScheme.dimension.tinyFont))
                    .foregroundColor(UIScheme.color.paymentDetailsTitleColor)
                Text(paymentID)
                    .font(UIScheme.font.commonBold(size: UIScheme.dimension.smallFont))
                    .foregroundColor(UIScheme.color.paymentDetailsForegroundColor)
            }
        } else {
            EmptyView()
        }
    }
}

#if DEBUG
struct VerifyOverview_Previews: PreviewProvider {
    static var previews: some View {
        VerifyOverview(
            paymentID: "EP2e11-f018-RQR12-26VL-0412CS",
            paymentDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
            backgroundTemplate: .lines,
            logoImage: IR.applePayButtonLogo.image,
            isDimBackground: true
        ).padding().previewLayout(.sizeThatFits)
    }
}
#endif
