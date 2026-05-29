//
//  SbpWebViewScreen.swift
//  mobileSDK.UI
//
//  Created by Claude Code
//

import SwiftUI
import WebKit

struct SbpWebViewScreen: View {
    let webViewData: String
    let paymentOptions: any PaymentOptions
    var onClose: () -> Void

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                ScreenHeader(text: "SBP")
                Spacer()
                CloseButton(onTap: onClose)
            }
            .padding(UIScheme.dimension.middleSpacing)

            SbpWebView(url: webViewData)
                .frame(maxWidth: .infinity, maxHeight: .infinity)

            FooterView(footerImage: paymentOptions.footerImage)
                .padding(.bottom, 25)
        }
    }
}

struct SbpWebView: UIViewRepresentable {
    let url: String

    func makeUIView(context: Context) -> WKWebView {
        let configuration = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: configuration)
        webView.navigationDelegate = context.coordinator
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        if let url = URL(string: url) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            guard let url = navigationAction.request.url else {
                decisionHandler(.allow)
                return
            }

            let scheme = url.scheme?.lowercased() ?? ""

            // Allow http and https to load in WebView
            if scheme == "http" || scheme == "https" {
                decisionHandler(.allow)
                return
            }

            // Open other schemes externally (like bank apps)
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }

            decisionHandler(.cancel)
        }
    }
}
