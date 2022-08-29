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
    var delegateProxy: ApsPageWebViewDelegateProxy?

    @State var isLoading = false

    init(viewModel: VM) {
        self.viewModel = viewModel
        if let paymentUrl = self.viewModel.state.apsPaymentMethod?.paymentUrl {
            self.delegateProxy = ApsPageWebViewDelegateProxy(
                paymentUrl: paymentUrl,
                onLadingStateChanges: { [self] isLoading in
                    self.isLoading = isLoading
                },
                onCompleted: {
                    viewModel.dispatch(intent: .executePayment)
                }
            )
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                ScreenHeader(text: viewModel.state.apsPaymentMethod?.displayName ?? "APS method")
                Spacer()
                CloseButton {
                    viewModel.dispatch(intent: .close)
                }
                .padding(UIScheme.dimension.largeSpacing)
            }.padding(.horizontal, UIScheme.dimension.largeSpacing)
            WebView { webView in
                webView.navigationDelegate = delegateProxy
                if let paymentUrlString = self.viewModel.state.apsPaymentMethod?.paymentUrl,
                   let url = URL(string: paymentUrlString) {
                    isLoading = true
                    webView.load(URLRequest(url: url))
                }
            }
            .opacity(isLoading ? 0 : 1)
            .overlay(
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: UIScheme.color.brandColor))
                    .opacity(isLoading ? 1 : 0)
            )
            .frame(maxWidth: .infinity)
        }
    }
}

class ApsPageWebViewDelegateProxy: NSObject, WKNavigationDelegate {
    let onLadingStateChanges: (_ isLoading: Bool) -> Void
    let onCompleted: () -> Void
    let paymentUrl: String
    private var currentUrl: String?

    init(paymentUrl: String,
onLadingStateChanges: @escaping (_ isLoading: Bool) -> Void,
     onCompleted: @escaping () -> Void) {
        self.paymentUrl = paymentUrl
        self.onLadingStateChanges = onLadingStateChanges
        self.onCompleted = onCompleted
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if (currentUrl != paymentUrl) {
            onCompleted()
        }
    }

    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: ((WKNavigationActionPolicy) -> Void)) {
        let request = navigationAction.request
        currentUrl = request.url?.absoluteString

        decisionHandler(.allow)
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        if (error as NSError).code == NSURLErrorCancelled {
            return
        }
    }
}

#if DEBUG

struct ApsScreen_Previews: PreviewProvider {

    static var previews: some View {
        ApsScreen(viewModel: ApsScreenViewModel(parentViewModel: MockRootViewModel(with: stateMock)))
    }
}

#endif

enum ApsScreenIntent {
    case close
    case executePayment
}

protocol ApsScreenState {
    var apsPaymentMethod: PaymentMethod? { get }
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
