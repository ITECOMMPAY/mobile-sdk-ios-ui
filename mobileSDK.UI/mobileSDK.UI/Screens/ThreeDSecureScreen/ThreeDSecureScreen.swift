//
//  ThreeDSecureScreen.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 14.08.2022.
//

import SwiftUI
import WebKit
import Combine

struct ThreeDSecureScreen<VM: ThreeDSecureScreenViewModelProtocol>: View, ViewWithViewModel {
    @ObservedObject var viewModel: VM
    @State var isLoading = false

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Spacer()
                CloseButton {
                    viewModel.dispatch(intent: .close)
                }
                .accessibilitySortPriority(-1)
            }.padding(UIScheme.dimension.largeSpacing)
            webView
            .opacity(isLoading ? 0 : 1)
            .overlay(loader)
            .frame(maxWidth: .infinity)
        }.onAppear {
            UIAccessibility.post(notification: .screenChanged, argument: nil)
        }
    }

    @ViewBuilder
    var webView: some View {
        if let threeDSecurePage = self.viewModel.state.threeDSecurePageState?.threeDSecurePage,
           let content = threeDSecurePage.content,
           let loadUrl = threeDSecurePage.loadUrl,
           let baseURL = URL(string: loadUrl) {
            WebView(task: .loadHTMLString(html: content, baseURL: baseURL)) { url in
                isLoading = threeDSecurePage.type == .THREE_DS_2_FRICTIONLESS
                
                if let url = url {
                    viewModel.dispatch(intent: .threeDSecure(url))
                }
            }.equatable()
        } else {
            Spacer()
        }
    }

    var loader: some View {
        Group {
            if isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: UIScheme.color.brandColor))
                    .scaleEffect(x: 2, y: 2, anchor: .center)
            } else {
                EmptyView()
            }
        }
    }
}

#if DEBUG

struct ThreeDSecureScreen_Previews: PreviewProvider {

    static var previews: some View {
        ThreeDSecureScreen(
            viewModel: ThreeDSecureScreenViewModel(
                parentViewModel: MockRootViewModel(with: stateMock)
            )
        )
    }
}

#endif

enum ThreeDSecureScreenIntent {
    case close
    case threeDSecure(String)
}

protocol ThreeDSecureScreenState {
    var threeDSecurePageState: ThreeDSecurePageState? { get }
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
