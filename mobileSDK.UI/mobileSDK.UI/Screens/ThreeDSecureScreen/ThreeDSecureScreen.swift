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
    @State var handledACS: AcsPageState?

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Spacer()
                CloseButton {
                    viewModel.dispatch(intent: .close)
                }
            }.padding(UIScheme.dimension.largeSpacing)
            webView
            .opacity(isLoading ? 0 : 1)
            .overlay(loader)
            .frame(maxWidth: .infinity)
        }
        .onReceive(viewModel.statePublisher.map(\.acsPageState).removeDuplicates()) { newAcs in
            if handledACS != newAcs {
                isLoading = false
            }
        }
    }

    @ViewBuilder
    var webView: some View {
        if let acsPage = self.viewModel.state.acsPageState?.acsPage,
           let html = acsPage.content,
           let acsUrl = acsPage.acsUrl,
           let baseURL = URL(string: acsUrl){
            WebView(task: .loadHTMLString(html: html, baseURL: baseURL)) { url in
                if let finalUrl = url,
                   let termUrl = acsPage.termUrl,
                   finalUrl == termUrl {
                    isLoading = true
                    handledACS = self.viewModel.state.acsPageState
                    viewModel.dispatch(intent: .threeDSecureHandled)
                }
            }.equatable()
        } else {
            Spacer()
        }
    }

    var loader: some View {
        Group {
            if isLoading {
                LoadingView()
            } else {
                EmptyView()
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

