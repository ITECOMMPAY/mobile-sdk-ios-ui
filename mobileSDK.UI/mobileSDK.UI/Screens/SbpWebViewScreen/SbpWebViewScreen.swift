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
    let paymentMethod: PaymentMethod?
    let paymentOptions: any PaymentOptions
    var onClose: () -> Void

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                ScreenHeader(text: paymentMethod?.displayName ?? "SBP")
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
            context.coordinator.initialHost = url.host
            webView.load(request)
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        var initialHost: String?

        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            guard let url = navigationAction.request.url,
                  navigationAction.targetFrame?.isMainFrame ?? true else {
                decisionHandler(.allow)
                return
            }

            let scheme = url.scheme?.lowercased() ?? ""

            // Handle custom schemes (bank apps, SBP, etc.)
            if scheme != "http" && scheme != "https" {
                handleCustomScheme(url: url)
                decisionHandler(.cancel)
                return
            }

            // Check if this is a redirect to a different host
            if let initialHost = initialHost?.lowercased(),
               let currentHost = url.host?.lowercased(),
               currentHost != initialHost {
                // Different host - try to open externally
                UIApplication.shared.open(url, options: [.universalLinksOnly: true]) { success in
                    if !success {
                        UIApplication.shared.open(url)
                    }
                }
                decisionHandler(.cancel)
                return
            }

            // Same host or initial load - allow in WebView
            decisionHandler(.allow)
        }

        private func handleCustomScheme(url: URL) {
            UIApplication.shared.open(url, options: [:]) { success in
                guard !success else { return }

                // Try to find and use fallback URL if app is not installed
                guard let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
                      let fallbackUrl = components.queryItems?.first(where: {
                          ["fallback", "browser_fallback_url", "fallback_url"].contains($0.name.lowercased())
                      })?.value,
                      let fallback = URL(string: fallbackUrl) else { return }

                UIApplication.shared.open(fallback)
            }
        }
    }
}
