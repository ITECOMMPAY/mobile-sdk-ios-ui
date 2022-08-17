//
//  ThreeDSecureScreen.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 14.08.2022.
//

import SwiftUI
import WebKit

struct ThreeDSecureScreen<VM: ThreeDSecureScreenViewModelProtocol>: View, ViewWithViewModel {
    @ObservedObject var viewModel: VM
    var delegateProxy: AcsPageWebViewDelegateProxy?

    @State var isLoading = false

    init(viewModel: VM) {
        self.viewModel = viewModel
        if let acsPage = self.viewModel.state.acsPageState?.acsPage {
            self.delegateProxy = AcsPageWebViewDelegateProxy(acsPage:acsPage, onLoadingStateChanges: { [self] isLoading in
                self.isLoading = isLoading
            }, onThreeDSecureHandled: {
                viewModel.dispatch(intent: .threeDSecureHandled)
            })
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Spacer()
                CloseButton {
                    viewModel.dispatch(intent: .close)
                }
                .padding(UIScheme.dimension.largeSpacing)
            }
            WebView { webView in
                webView.navigationDelegate = delegateProxy
                if let acsPage = viewModel.state.acsPageState?.acsPage,
                   let html = acsPage.content,
                   let acsUrl = acsPage.acsUrl {
                    isLoading = true
                    webView.loadHTMLString(html, baseURL: URL(string: acsUrl))
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

    var acsURL: URL? {
        guard let urlString = viewModel.state.acsPageState?.acsPage?.acsUrl else {
            return nil
        }
        return URL(string: urlString)
    }
}

class AcsPageWebViewDelegateProxy: NSObject, WKNavigationDelegate {
    let onloadingStateChanges: (_ isLoading: Bool) -> Void
    let acsPage: AcsPage
    let onThreeDSecureHandled: () -> Void

    init(acsPage: AcsPage,
         onLoadingStateChanges: @escaping (_ isLoading: Bool) -> Void,
         onThreeDSecureHandled: @escaping () -> Void) {
        self.onloadingStateChanges = onLoadingStateChanges
        self.acsPage = acsPage
        self.onThreeDSecureHandled = onThreeDSecureHandled
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        onloadingStateChanges(false)
    }

    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: ((WKNavigationActionPolicy) -> Void)) {
        if let url = navigationAction.request.url {
            if url.absoluteString == acsPage.termUrl {
                onThreeDSecureHandled()
            }
        }

        decisionHandler(.allow)
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        if ((error as NSError).code == NSURLErrorCancelled) {
            return
        }
        onloadingStateChanges(false)
    }
}

#if DEBUG

struct ThreeDSecureScreen_Previews: PreviewProvider {

    static var previews: some View {
        ThreeDSecureScreen(viewModel: ThreeDSecureScreenViewModel(parentViewModel: MockRootViewModel(with: stateMock)))
    }
}

#endif

enum ThreeDSecureScreenIntent {
    case close
    case threeDSecureHandled
}

protocol ThreeDSecureScreenState {
    var acsPageState: AcsPageState? { get }
}

protocol ThreeDSecureScreenViewModelProtocol: ViewModel
where UserIntent == ThreeDSecureScreenIntent,
      ViewState == ThreeDSecureScreenState {}

class ThreeDSecureScreenViewModel<rootVM: RootViewModelProtocol>: ChildViewModel<ThreeDSecureScreenState, ThreeDSecureScreenIntent, rootVM>, ThreeDSecureScreenViewModelProtocol {
    override func mapState(from parentState: RootState) throws -> ThreeDSecureScreenState {
        parentState as ThreeDSecureScreenState
    }

    override func mapIntent(from childIntent: ThreeDSecureScreenIntent) throws -> RootIntent {
        .threeDSecureScreenIntent(childIntent)
    }
}

extension RootState: ThreeDSecureScreenState {}
