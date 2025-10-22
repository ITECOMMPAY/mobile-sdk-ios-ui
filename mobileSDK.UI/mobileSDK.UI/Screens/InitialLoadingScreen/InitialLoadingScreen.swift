//
//  InitialLoadingScreen.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 01.08.2022.
//

import Foundation

import SwiftUI

enum InitialLoadingScreenIntent {
    case close
}

protocol InitialLoadingScreenState {
    var paymentOptions: PaymentOptions { get }
}

extension RootState: InitialLoadingScreenState { }

protocol InitialLoadingScreenViewModelProtocol: ViewModel
where UserIntent == InitialLoadingScreenIntent, ViewState == InitialLoadingScreenState {}

class InitialLoadingScreenViewModel<rootVM: RootViewModelProtocol>: ChildViewModel<InitialLoadingScreenState, InitialLoadingScreenIntent, rootVM>, InitialLoadingScreenViewModelProtocol {
    override func mapIntent(from childIntent: InitialLoadingScreenIntent) throws -> rootVM.UserIntent {
        return .initialLoadingScreenIntent(childIntent)
    }
    
    override func mapState(from parentState: rootVM.ViewState) throws -> InitialLoadingScreenState {
        return parentState as InitialLoadingScreenState
    }
}

struct InitialLoadingScreen<VM: InitialLoadingScreenViewModelProtocol>: View, ViewWithViewModel {
    @ObservedObject var viewModel: VM

    public var body: some View {
        return BottomCardViewContent {
            VStack(alignment: .leading, spacing: UIScheme.dimension.middleSpacing) {
                HStack(alignment: .center) {
                    ScreenHeader(text: screenTitle)
                    Spacer()
                    CloseButton {
                        viewModel.dispatch(intent: .close)
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .padding(UIScheme.dimension.middleSpacing)
        } content: {
            VStack(spacing: 12) {
                VStack(spacing: 12) {
                    loadingStateHeader
                    
                    RedactedView()
                        .frame(height: 240)
                        .cornerRadius(UIScheme.dimension.buttonCornerRadius)
                    
                    paymentMethodsPlaceholders
                }
                .shimmer()
                
                if !viewModel.state.paymentOptions.hideFooterLogo {
                    FooterView(footerImage: viewModel.state.paymentOptions.footerImage)
                }
            }
            .padding([.horizontal, .bottom], UIScheme.dimension.middleSpacing)
        }
        .background(UIScheme.color.background)
        .onAppear {
            UIAccessibility.post(notification: .screenChanged, argument: nil)
        }
    }
    
    private var screenTitle: String {
        switch viewModel.state.paymentOptions.action {
        case .Tokenize:
            return L.localizationDefaults[L.button_tokenize] ?? ""
        case .Verify:
            return L.localizationDefaults[L.button_authorize] ?? ""
        default:
            return L.localizationDefaults[L.title_payment_methods] ?? ""
        }
    }

    @ViewBuilder
    private var loadingStateHeader: some View {
        RedactedView()
            .frame(height: 172)
            .cornerRadius(UIScheme.dimension.backgroundSheetCornerRadius)
        HStack {
            RedactedView()
                .clipShape(.capsule)
                .cornerRadius(UIScheme.dimension.buttonCornerRadius)
        }
        .frame(height: UIScheme.dimension.applePayButtonHeight)
    }

    private var paymentMethodsPlaceholders: some View {
        VStack(spacing: 12) {
            ForEach((0..<3), id: \.self) { _ in
                RedactedView()
                    .frame(height: UIScheme.dimension.paymentMethodButtonHeight)
                    .cornerRadius(UIScheme.dimension.buttonCornerRadius)
            }
        }
    }
}

#if DEBUG

struct InitialLoadingScreen_Previews: PreviewProvider {
    static var previews: some View {
        InitialLoadingScreen(viewModel: InitialLoadingScreenViewModel(parentViewModel: MockRootViewModel(with: stateMock)))
    }
}

#endif
