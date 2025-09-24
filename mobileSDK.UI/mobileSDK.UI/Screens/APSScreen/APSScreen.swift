//
//  ApsScreen.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 25.08.2022.
//

import SwiftUI
import WebKit

struct ApsScreen<VM: ApsScreenViewModelProtocol>: View, ViewWithViewModel {
    @ObservedObject var viewModel: VM

    @State var isLoading = false
    @State var isStartedStatusCheck = false

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                ScreenHeader(text: viewModel.state.apsPaymentMethod?.displayName ?? "APS method")
                Spacer()
                CloseButton {
                    viewModel.dispatch(intent: .close)
                }
            }.padding(UIScheme.dimension.largeSpacing)
            Group {
                if let paymentUrlString = self.viewModel.state.apsPaymentMethod?.paymentUrl,
                   let url = URL(string: paymentUrlString) {
                    WebView(task: .request(URLRequest(url: url))) { url in
                        if viewModel.state.isTryAgain {
                            isStartedStatusCheck = false
                        }
                        
                        isLoading = false
                        if let currentUrl = url,
                           let paymentUrlString = self.viewModel.state.apsPaymentMethod?.paymentUrl,
                           !currentUrl.hasPrefix(paymentUrlString), !isStartedStatusCheck {
                            isStartedStatusCheck = true
                            viewModel.dispatch(intent: .executePayment)
                        }
                    }.equatable()
                } else {
                    Spacer()
                }
            }
            .opacity(isLoading ? 0 : 1)
            .overlay(
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: UIScheme.color.primaryBrandColor))
                    .opacity(isLoading ? 1 : 0)
            )
            .frame(maxWidth: .infinity)

        }.onAppear {
            UIAccessibility.post(notification: .screenChanged, argument: nil)
        }
    }
}
#if DEBUG

struct ApsScreen_Previews: PreviewProvider {

    static var previews: some View {
        ApsScreen(viewModel: ApsScreenViewModel(parentViewModel: MockRootViewModel(with: stateMock)))
            .previewLayout(.sizeThatFits)
    }
}

#endif

enum ApsScreenIntent {
    case close
    case executePayment
}

protocol ApsScreenState {
    var apsPaymentMethod: PaymentMethod? { get }
    var isTryAgain: Bool { get }
}

protocol ApsScreenViewModelProtocol: ViewModel
where UserIntent == ApsScreenIntent,
      ViewState == ApsScreenState {}

class ApsScreenViewModel<rootVM: RootViewModelProtocol>: ChildViewModel<ApsScreenState, ApsScreenIntent, rootVM>, ApsScreenViewModelProtocol {
    override func mapState(from parentState: RootState) throws -> ApsScreenState {
        parentState as ApsScreenState
    }

    override func mapIntent(from childIntent: ApsScreenIntent) throws -> RootIntent {
        .apsScreenIntent(childIntent)
    }
}

extension RootState: ApsScreenState {}
