//
//  PaymentsMethodsLoadingView.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 10.06.2022.
//

import Foundation

import SwiftUI

public class PaymentsMethodsLoadingViewModel: PaymentsMethodsLoadingViewModelProtocol {

}

public protocol PaymentsMethodsLoadingViewModelProtocol: ObservableObject {

}

public struct PaymentsMethodsLoadingView/*<VM: PaymentsMethodsLoadingViewModelProtocol>*/: View {

    //@ObservedObject public var viewModel: VM

    public init() {}

    public var body: some View {
        ZStack(alignment: .bottom) {
            backgroundCover
            bottomSheet.edgesIgnoringSafeArea(.bottom)
        }
    }

    var bottomSheet: some View {
        BottomCardView {
            VStack(alignment: .leading, spacing: UIScheme.dimension.middleSpacing) {
                HStack(alignment: .center){
                    ScreenHeader(text: L.title_payment_methods.string)
                    Spacer()
                    CloseButton()
                }
                .frame(maxWidth: .infinity)
                RedactedView()
                    .cornerRadius(UIScheme.dimension.smallestCornerRadius)
                    .frame(width: 125, height: 20, alignment: .leading)
                RedactedView()
                    .frame(height: 150)
                    .cornerRadius(UIScheme.dimension.backgroundSheetCornerRadius)
            }.padding([.trailing, .leading, .top], UIScheme.dimension.largeSpacing)
        } content: {
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
                    FooterView().padding(.bottom, UIScheme.dimension.largeSpacing)
                }.padding([.trailing, .leading], UIScheme.dimension.largeSpacing)
            }.padding(.top, UIScheme.dimension.middleSpacing)
        }
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
            PaymentsMethodsLoadingView(/*viewModel: PaymentsMethodsLoadingViewModel()*/)
        }.edgesIgnoringSafeArea(.vertical)
    }
}
