//
//  SbpQrScreen.swift
//  mobileSDK.UI
//
//  Created by Claude on 21.05.2026.
//

import SwiftUI

struct SbpQrScreen: View {
    let qrData: String
    let paymentOptions: PaymentOptions
    let onLinkTap: (String) -> Void
    let onClose: () -> Void

    @State private var qrImage: UIImage?
    @State private var showQrCode: Bool = false

    private let isTablet: Bool = UIDevice.current.userInterfaceIdiom == .pad

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                ScreenHeader(text: "SBP")
                Spacer()
                CloseButton {
                    onClose()
                }
            }
            .padding(UIScheme.dimension.middleSpacing)

            ScrollView {
                VStack(spacing: 20) {
                    if paymentOptions.action != .Verify || paymentOptions.summary.logo != nil {
                        PaymentOverview(
                            priceValue: paymentOptions.summary.value,
                            currency: paymentOptions.summary.currency,
                            recurringData: paymentOptions.recurringDetails,
                            paymentDetails: paymentOptions.details,
                            logoImage: paymentOptions.summary.logo
                        )
                        .padding(.top, 24)
                    }

                    if isTablet {
                        tabletContent
                    } else {
                        phoneContent
                    }

                    Spacer()
                    FooterView(footerImage: paymentOptions.footerImage)
                        .padding(.bottom, 25)
                }
                .padding(.horizontal, 20)
            }
        }
        .background(UIScheme.color.background)
        .onAppear {
            if isTablet {
                generateQrCode()
            } else {
                // Automatically open link on phone after a delay
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    onLinkTap(qrData)
                }
            }
        }
    }

    private var tabletContent: some View {
        VStack(spacing: 14) {
            if let qrImage = qrImage {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(UIScheme.color.cardBackground)
                        .frame(width: 276, height: 276)

                    Image(uiImage: qrImage)
                        .resizable()
                        .interpolation(.none)
                        .frame(width: 240, height: 240)
                }
            }

            qrLinkText

            PayButton(
                label: PayButtonLabel(style: .pay(
                    amount: paymentOptions.summary.value,
                    currency: paymentOptions.summary.currency
                )),
                disabled: false
            ) {
                onLinkTap(qrData)
            }
        }
    }

    private var phoneContent: some View {
        VStack(spacing: 20) {
            qrLinkText
        }
    }

    private var qrLinkText: some View {
        Text(qrData)
            .font(.custom(.primary(size: .s, weight: .regular)))
            .foregroundColor(UIScheme.color.brandPrimary)
            .underline()
            .multilineTextAlignment(.center)
            .onTapGesture {
                onLinkTap(qrData)
            }
    }

    private func generateQrCode() {
        qrImage = QrGenerator.generateQrImage(from: qrData, size: 768)
    }
}

#if DEBUG

struct SbpQrScreen_Previews: PreviewProvider {
    static var previews: some View {
        SbpQrScreen(
            qrData: "https://example.com/sbp/qr/payment?id=1234567890",
            paymentOptions: MockPaymentOptions(),
            onLinkTap: { _ in },
            onClose: {}
        )
    }
}

#endif
