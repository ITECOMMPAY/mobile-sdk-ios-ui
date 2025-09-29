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
        PaymentDetailsButton(expanded: expanded) {
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
                .overlay(UIScheme.color.cardBackground)
                .opacity(0.1)
            ForEach(details, id: \.title) { detail in
                PaymentDetailsAttributes(
                    labelText: detail.title.string,
                    descriptionText: detail.description,
                    canCopy: detail.canBeCopied
                )
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
            Text(labelText)
                .font(.custom(.primary(size: .xs, weight: .regular)))
                .foregroundColor(UIScheme.color.buttonCard)
                .opacity(0.6)
                .accessibilityAddTraits(.isHeader)
            HStack {
                Text(descriptionText)
                    .font(.custom(.primary(size: .s, weight: canCopy ? .bold : .regular)))
                    .foregroundColor(UIScheme.color.buttonCard)
                if canCopy {
                    Spacer()
                    ZStack {
                        Circle()
                            .fill(Color.white)
                            .opacity(0.1)
                            .frame(width: 32, height: 32)
                        Image(systemName: "square.on.square")
                            .scaleEffect(x: -1, y: 1)
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(UIScheme.color.cardBackground)
                    }
                }
            }
        }
    }
}

#if DEBUG

struct PaymentDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.red
            PaymentDetailsView(
                expanded: true,
                details: [
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
                    
                ]
            )
        }
    }
}

#endif
