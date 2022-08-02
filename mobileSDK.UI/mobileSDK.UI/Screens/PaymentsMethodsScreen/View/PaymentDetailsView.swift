//
//  PaymentDetailsView.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 27.06.2022.
//

import SwiftUI

struct PaymentDetailsView: View {
    @State var expanded: Bool = false
    let details: [PaymentDetailData]

    var body: some View {
        VStack(alignment: .leading, spacing: UIScheme.dimension.middleSpacing) {
            togglePaymentDetailsButton
            if expanded {
                paymentDetailCard
            }
        }
    }

    private var togglePaymentDetailsButton: some View {
        Button {
            expanded.toggle()
        } label: {
            Text(L.title_payment_information_screen.string)
                .foregroundColor(UIScheme.color.brandColor)
                .font(UIScheme.font.commonRegular(size: UIScheme.dimension.smallFont))
                .frame(alignment: .leading)
                .opacity(expanded ? 0.3 : 1.0)
        }
        .contentShape(Rectangle())
    }

    private var paymentDetailCard: some View {
        ZStack(alignment: .topTrailing) {
            CloseButton(foregroundColor: .black) {
                expanded.toggle()
            }.padding(UIScheme.dimension.paymentDetailsSpacing)

            VStack(alignment: .leading, spacing: UIScheme.dimension.largeSpacing) {
                ForEach(details, id: \.title) { detail in
                    PaymentDetailsAttributes(labelText: detail.title.string,
                                             descriptionText: detail.description,
                                             canCopy: detail.canBeCopied)
                }
            }
            .padding(UIScheme.dimension.paymentDetailsSpacing)
            .frame(maxWidth: .infinity, alignment: .leading)
            .overlay(
                RoundedRectangle(cornerRadius: UIScheme.dimension.backgroundSheetCornerRadius)
                    .stroke(UIScheme.color.border, lineWidth: UIScheme.dimension.borderWidth)
            )

        }
        .background(UIScheme.color.paymentDetailsBackground)
        .cornerRadius(UIScheme.dimension.backgroundSheetCornerRadius)
    }

}

struct PaymentDetailsAttributes: View {
    var labelText: String
    var descriptionText: String
    var canCopy: Bool = false
    var body: some View {
        VStack(alignment: .leading, spacing: UIScheme.dimension.paymentDetailsAttributeSpacing) {
            HStack(spacing: UIScheme.dimension.paymentDetailsAttributeSpacing) {
                Text(labelText).font(UIScheme.font.commonRegular(size: UIScheme.dimension.smallFont))
                    .foregroundColor(UIScheme.color.paymentDetailsInnerTitleColor)
                Button {
                    UIPasteboard.general.string = descriptionText
                } label: {
                    IR.copyButton.image?.frame(width: 16, height: 16, alignment: .center)
                }
                .applyIf(!canCopy) {
                    $0.hidden()
                }
            }
            Text(descriptionText)
                .font(canCopy ? UIScheme.font.commonBold(size: UIScheme.dimension.smallFont) : UIScheme.font.commonRegular(size: UIScheme.dimension.smallFont))
                .foregroundColor(UIScheme.color.paymentDetailsDescriptionColor)
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
