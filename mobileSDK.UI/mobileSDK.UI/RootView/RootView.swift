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
        .alert(isPresented: .constant(alert != nil)) {
            alert!
        }
        .onTapGesture {
            hideKeyboard()
        }
    }

    private var alert: Alert? {
        guard let error = viewModel.state.error else { return nil }
        return Alert(title: Text(error.code.rawValue),
                    message: Text(error.message),
                     dismissButton: Alert.Button.default(Text("Close"), action: {
            viewModel.dispatch(intent: .closeErrorAlert)
        }))
    }
}

#if DEBUG

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
       RootView(viewModel: MockRootViewModel(with: stateMock))
    }
}

#endif
