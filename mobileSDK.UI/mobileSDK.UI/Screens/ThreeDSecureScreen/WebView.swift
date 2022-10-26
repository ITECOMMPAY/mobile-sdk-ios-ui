//
//  ACSView.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 15.08.2022.
//

import SwiftUI
import WebKit

final class WebView: NSObject, UIViewRepresentable {

    internal init(configuration: @escaping (WKWebView) -> Void,
                  didFinish: @escaping (String?) -> Void) {
        self.didFinish = didFinish
        self.configuration = configuration
    }


    // MARK: - Properties

    let didFinish: (_ url: String?) -> Void
    let configuration: (WKWebView) -> Void

    private var currentUrl: String?

    // MARK: - Functions

    public func makeUIView(context: Context) -> WKWebView {
        let view = WKWebView()
        view.navigationDelegate = self
        configuration(view)
        return view
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.navigationDelegate = self
    }
}

extension WebView: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        didFinish(self.currentUrl)
    }

    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: ((WKNavigationActionPolicy) -> Void)) {
        currentUrl = navigationAction.request.url?.absoluteString
        decisionHandler(.allow)
    }
}
