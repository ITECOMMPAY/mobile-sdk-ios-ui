//
//  InitialLoadingScreen.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 01.08.2022.
//

import Foundation

import SwiftUI

enum InitialLoadingScreenIntent {
    case close
}

protocol InitialLoadingScreenViewModelProtocol: ViewModel
where UserIntent == InitialLoadingScreenIntent, ViewState == Void {} // ViewState == Void т.к. этот экран всегда в одном состоянии, его представление неизменно

class InitialLoadingScreenViewModel<rootVM: RootViewModelProtocol>: ChildViewModel<Void, InitialLoadingScreenIntent, rootVM>, InitialLoadingScreenViewModelProtocol {
    override func mapIntent(from childIntent: InitialLoadingScreenIntent) throws -> rootVM.UserIntent {
        return .initialLoadingScreenIntent(childIntent)
    }
}

struct InitialLoadingScreen<VM: InitialLoadingScreenViewModelProtocol>: View, ViewWithViewModel {
    @ObservedObject var viewModel: VM

    public var body: some View {
        return BottomCardViewContent {
            VStack(alignment: .leading, spacing: UIScheme.dimension.middleSpacing) {
                HStack(alignment: .center) {
                    ScreenHeader(text: L.title_payment_methods.string)
                    Spacer()
                    CloseButton {
                        viewModel.dispatch(intent: .close)
                    }
                }
                .frame(maxWidth: .infinity)
                loadingStateHeader
            }.padding([.trailing, .leading, .top], UIScheme.dimension.largeSpacing)
        } content: {
            VStack(spacing: .zero) {
                paymentMethodsPlaceholders
                FooterView()
                    .padding(.bottom, UIScheme.dimension.largeSpacing)
            }
            .padding([.trailing, .leading], UIScheme.dimension.largeSpacing)
            .padding(.top, UIScheme.dimension.middleSpacing)
        }
    }

    @ViewBuilder
    private var loadingStateHeader: some View {
        RedactedView()
            .cornerRadius(UIScheme.dimension.smallestCornerRadius)
            .frame(width: 125, height: 20, alignment: .leading)
        RedactedView()
            .frame(height: 150)
            .cornerRadius(UIScheme.dimension.backgroundSheetCornerRadius)
        HStack {
            ForEach((0..<2), id: \.self) {_ in
                RedactedView()
                    .cornerRadius(UIScheme.dimension.buttonCornerRadius)
            }
        }.frame(height: UIScheme.dimension.applePayButtonHeight)
    }

    private var paymentMethodsPlaceholders: some View {
        VStack(spacing: UIScheme.dimension.smallSpacing) {
            ForEach((0..<6), id: \.self) {_ in
                RedactedView()
                    .frame(height: UIScheme.dimension.paymentMethodButtonHeight)
                    .cornerRadius(UIScheme.dimension.buttonCornerRadius)
            }
        }
    }
}
