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
                      dismissButton: Alert.Button.default(Text("Close"), action: {
                    viewModel.dispatch(intent: .alertClosed)
                    onClose?()
                }))
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
