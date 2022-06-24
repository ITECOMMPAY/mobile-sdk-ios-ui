//
//  PaymentsMethodsLoadingView.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 10.06.2022.
//

import Foundation

import SwiftUI

public struct PaymentsMethodsLoadingView: View {

    public init() {}

    @State
    private var scrollViewContentSize: CGSize = .zero

    public var body: some View {
        ZStack(alignment: .bottom) {
            backgroundCover
            bottomSheet.edgesIgnoringSafeArea(.bottom)
        }
    }

    var bottomSheet: some View {
        ZStack {
            UIScheme.color.mainBackground
            VStack(alignment: .leading, spacing: 0) {
                VStack(alignment: .leading, spacing: UIScheme.dimension.middleSpacing) {
                    HStack(alignment: .center){
                        screenHeader
                        Spacer()
                        closeButton.frame(width: 40, height: 40)
                    }
                    .frame(maxWidth: .infinity)
                    RedactedView()
                        .cornerRadius(UIScheme.dimension.smallestCornerRadius)
                        .frame(width: 125, height: 20, alignment: .leading)
                    RedactedView()
                        .frame(height: 150)
                        .cornerRadius(UIScheme.dimension.backgroundSheetCornerRadius)
                }.padding([.trailing, .leading, .top], UIScheme.dimension.largeSpacing)

                VStack {
                    VStack(spacing: UIScheme.dimension.smallSpacing) {
                        HStack {
                            ForEach((0..<2), id: \.self)  {_ in
                                RedactedView()
                                    .cornerRadius(UIScheme.dimension.buttonCornerRadius)
                            }
                        }.frame(height: UIScheme.dimension.applePayButtonHeight)
                        ForEach((0..<6), id: \.self)  {_ in
                            RedactedView()
                                .frame(height: UIScheme.dimension.paymentMethodButtonHeight)
                                .cornerRadius(UIScheme.dimension.buttonCornerRadius)
                        }
                        screenFooter
                    }.padding([.trailing, .leading], UIScheme.dimension.largeSpacing)
                }.padding(.top, UIScheme.dimension.middleSpacing)
            }
        }.background(
            GeometryReader { geo -> Color in
                DispatchQueue.main.async {
                    scrollViewContentSize = geo.size
                }
                return Color.clear
            })
        .cornerRadius(UIScheme.dimension.backgroundSheetCornerRadius, corners: [.topLeft, .topRight])
        .frame(height: scrollViewContentSize.height, alignment: .bottom)
    }

    var screenHeader: some View {
        Text("Payment Methods")
            .foregroundColor(UIScheme.color.screenHeader)
            .font(UIScheme.font.screenHeader)
            .frame(alignment: .leading)

    }

    var closeButton: some View {
        Button {
            print("Close button was tapped")
        } label: {
            IR.closeButton.image
        }
    }

    var screenFooter: some View {
        IR.poweredByLogo.image?
            .frame(height: UIScheme.dimension.paymentDetailsSpacing)
            .padding(.top, UIScheme.dimension.smallSpacing)
    }

    var backgroundCover: some View {
        UIScheme.color.dimming.edgesIgnoringSafeArea(.vertical)
    }
}

struct PaymentsMethodsLoadingView_Previews: PreviewProvider {
    static var backgroundAppImitation: some View {
        VStack {
            ForEach((1...50), id: \.self)  {_ in
                Color(red: .random(in: 0...1),
                      green: .random(in: 0...1),
                      blue: .random(in: 0...1),
                      opacity: 1.0)
            }
        }
    }

    static var previews: some View {
        ZStack {
            backgroundAppImitation
            PaymentsMethodsLoadingView()
        }.edgesIgnoringSafeArea(.vertical)
    }
}



