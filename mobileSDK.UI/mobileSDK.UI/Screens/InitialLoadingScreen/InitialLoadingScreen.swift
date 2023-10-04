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
                loadingStateHeader
            }.padding([.horizontal, .top], UIScheme.dimension.largeSpacing)
        } content: {
            VStack(spacing: .zero) {
                paymentMethodsPlaceholders
                FooterView()
                    .padding([.top, .bottom], UIScheme.dimension.largeSpacing)
            }
            .padding(.horizontal, UIScheme.dimension.largeSpacing)
            .padding(.top, UIScheme.dimension.middleSpacing)
            .background(UIScheme.color.mainBackground)
        }.onAppear {
            UIAccessibility.post(notification: .screenChanged, argument: nil)
        }
    }
    
    private var screenTitle: String {
        switch viewModel.state.paymentOptions.action {
        case .Tokenize:
            return "tokenize_label".localizedWithCode(languageCode: viewModel.state.paymentOptions.languageCode)
        case .Verify:
            return "verify_label".localizedWithCode(languageCode: viewModel.state.paymentOptions.languageCode)
        default:
            return "sale_label".localizedWithCode(languageCode: viewModel.state.paymentOptions.languageCode)
        }
    }

    @ViewBuilder
    private var loadingStateHeader: some View {
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

#if DEBUG

struct InitialLoadingScreen_Previews: PreviewProvider {
    static var previews: some View {
        InitialLoadingScreen(viewModel: InitialLoadingScreenViewModel(parentViewModel: MockRootViewModel(with: stateMock)))
    }
}

#endif
