//
//  PaymentDetailsView.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 27.06.2022.
//

import SwiftUI

struct PaymentDetailsView: View {
    @State var expanded: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: UIScheme.dimension.middleSpacing) {
            togglePaymentDetailsButton
            paymentDetailCard
        }
    }

    private var togglePaymentDetailsButton: some View {
        Button {
            expanded.toggle()
        } label: {
            Text(L.payment_details.string)
                .foregroundColor(UIScheme.color.brandColor)
                .font(UIScheme.font.commonRegular)
                .frame(alignment: .leading)
                .opacity(expanded ? 1.0 : 0.3)
        }
    }

    private var paymentDetailCard: some View {
        ZStack(alignment: .topTrailing) {
            CloseButton(foregroundColor: .black) {
                expanded.toggle()
            }.padding(UIScheme.dimension.paymentDetailsSpacing)
            VStack(alignment: .leading, spacing: UIScheme.dimension.largeSpacing) {
                PaymentDetailsAttributes(labelText: "Payment ID",
                                         descriptionText: "EP2e11-f018-RQR12-26VL-0412CS",
                                         canCopy: true)
                PaymentDetailsAttributes(labelText: "Description",
                                         descriptionText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.")
                PaymentDetailsAttributes(labelText: "Address",
                                         descriptionText: "Test address is incorporated in St. Vincent & the Grenadines as an International Business Company with registration number ********")

            }
            .padding(UIScheme.dimension.paymentDetailsSpacing)
            .overlay(
                RoundedRectangle(cornerRadius: UIScheme.dimension.backgroundSheetCornerRadius)
                    .stroke(UIScheme.color.border, lineWidth: UIScheme.dimension.borderWidth)
            )}.frame(height: expanded ? 0 : .infinity)
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
                Text(labelText).font(UIScheme.font.commonRegular)
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
                .font(canCopy ? UIScheme.font.commonRegular.bold() : UIScheme.font.commonRegular)
                .foregroundColor(UIScheme.color.paymentDetailsDescriptionColor)
        }
    }

}

struct PaymentDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.red
            PaymentDetailsView()

        }
    }
}






