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

    @State var isLoading = false

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Spacer()
                CloseButton {
                    viewModel.dispatch(intent: .close)
                }
            }.padding(UIScheme.dimension.largeSpacing)
            if let acsPage = self.viewModel.state.acsPageState?.acsPage {
                WebView { webView in
                    if let acsPage = viewModel.state.acsPageState?.acsPage,
                       let html = acsPage.content,
                       let acsUrl = acsPage.acsUrl {
                        webView.loadHTMLString(html, baseURL: URL(string: acsUrl))
                    }
                } didFinish: { finalUrl in
                    if let finalUrl = finalUrl,
                       let termUrl = acsPage.termUrl,
                       finalUrl == termUrl {
                        viewModel.dispatch(intent: .threeDSecureHandled)
                    }
                }
                .opacity(isLoading ? 0 : 1)
                .overlay(
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: UIScheme.color.brandColor))
                        .opacity(isLoading ? 1 : 0)
                )
                .frame(maxWidth: .infinity)
            } else {
                Spacer()
            }
        }
    }

    var acsURL: URL? {
        guard let urlString = viewModel.state.acsPageState?.acsPage?.acsUrl else {
            return nil
        }
        return URL(string: urlString)
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

