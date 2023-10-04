//
//  NavigationComponent.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 27.07.2022.
//

import SwiftUI

/// Корневая вью
struct RootView<ViewModel: RootViewModelProtocol>: View, ViewWithViewModel {
    @ObservedObject var viewModel: ViewModel
    let cardShown: Bool = true

    var body: some View {
        NavigationComponent(viewModel: NavigationComponentViewModel(parentViewModel: self.viewModel))
        .alert(isPresented: .constant(viewModel.state.alertModel != nil)) {
            alert
        }
        .onTapGesture {
            hideKeyboard()
        }
    }

    private var alert: Alert {
        if let model = viewModel.state.alertModel {
            switch model {
            case .FinalError(let coreError, let onClose), .InfoError(let coreError, let onClose):
                return Alert(title: Text(coreError.code.rawValue),
                      message: Text(coreError.message),
                      dismissButton: Alert.Button.default(Text(L.button_ok.string), action: {
                    viewModel.dispatch(intent: .alertClosed)
                    onClose?()
                }))
            case .CloseWarning(let confirmClose):
                return Alert(
                    title: Text("payment_dismiss_confirm_message".localizedWithCode(languageCode: viewModel.state.paymentOptions.languageCode)),
                    primaryButton: Alert.Button.cancel(Text("cancel_label".localizedWithCode(languageCode: viewModel.state.paymentOptions.languageCode)), action: {
                        viewModel.dispatch(intent: .alertClosed)
                    }),
                    secondaryButton: Alert.Button.default(Text(L.button_ok.string), action: {
                        viewModel.dispatch(intent: .alertClosed)
                        confirmClose?()
                    })
                )
            case .TokenizeResult(let message, let onClose):
                return Alert(
                    title: Text(message),
                    dismissButton: Alert.Button.default(Text(L.button_ok.string)) {
                        viewModel.dispatch(intent: .alertClosed)
                        onClose?()
                    }
                )
            }
        } else {
            let failure = "Alert model is nil"
            assertionFailure(failure)
            return Alert(title: Text(failure))
        }
    }
}

#if DEBUG

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
       RootView(viewModel: MockRootViewModel(with: stateMock))
    }
}

#endif
