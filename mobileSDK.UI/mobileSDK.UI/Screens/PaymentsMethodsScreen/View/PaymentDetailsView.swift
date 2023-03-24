//
//  PaymentDetailsView.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 27.06.2022.
//

import SwiftUI

struct PaymentDetailsView: View {
    @State var expanded: Bool = false
    let details: [PaymentDetailData]

    var body: some View {
        VStack(alignment: .leading, spacing: UIScheme.dimension.middleSpacing) {
            if expanded {
                paymentDetailCard.transition(.opacity)
            }
            togglePaymentDetailsButton
        }
    }

    private var togglePaymentDetailsButton: some View {
        PaymentDetailsButton(
            text: expanded ? L.button_hide_details.string : L.title_payment_information_screen.string
        ) {
            withAnimation {
                expanded.toggle()
            }
        }
    }

    private var paymentDetailCard: some View {
        VStack(alignment: .leading, spacing: UIScheme.dimension.paymentDetailsSpacing) {
            Divider()
                .frame(maxWidth: .infinity)
                .frame(height: UIScheme.dimension.dividerHeight)
                .overlay(UIScheme.color.paymentDetailsBackgroundColor)
            ForEach(details, id: \.title) { detail in
                PaymentDetailsAttributes(labelText: detail.title.string,
                                         descriptionText: detail.description,
                                         canCopy: detail.canBeCopied)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

}

struct PaymentDetailsAttributes: View {
    var labelText: String
    var descriptionText: String
    var canCopy: Bool = false
    var body: some View {
        VStack(alignment: .leading, spacing: UIScheme.dimension.tinySpacing) {
            HStack(spacing: UIScheme.dimension.tinySpacing) {
                Text(labelText).font(UIScheme.font.commonRegular(size: UIScheme.dimension.tinyFont))
                    .foregroundColor(UIScheme.color.paymentDetailsTitleColor)
                    .accessibilityAddTraits(.isHeader)
//                Button {
//                    UIPasteboard.general.string = descriptionText
//                } label: {
//                    IR.copyButton.image?.renderingMode(.template)
//                        .foregroundColor(UIScheme.color.paymentDetailsForegroundColor)
//                        .frame(width: 16, height: 16, alignment: .center)
//                }
//                .applyIf(!canCopy) {
//                    $0.hidden()
//                }
            }
            Text(descriptionText)
                .font(canCopy ? UIScheme.font.commonBold(size: UIScheme.dimension.smallFont) : UIScheme.font.commonRegular(size: UIScheme.dimension.smallFont))
                .foregroundColor(UIScheme.color.paymentDetailsForegroundColor)
        }
    }
}

#if DEBUG

struct PaymentDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.red
            PaymentDetailsView(expanded: true, details: [
                PaymentDetailData(title: L.title_payment_id,
                                  description: "EP2e11-f018-RQR12-26VL-0412CS",
                                  canBeCopied: true),
                PaymentDetailData(title: L.title_payment_information_description,
                                  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                                  canBeCopied: false)

            ])
        }
    }
}

#endif
