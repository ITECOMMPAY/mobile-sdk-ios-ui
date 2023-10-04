//
//  ACSView.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 15.08.2022.
//

import SwiftUI
import WebKit

enum WebViewTask: Equatable {
    case request(URLRequest)
    case loadHTMLString(html: String, baseURL: URL)
}

struct WebView: UIViewRepresentable, Equatable {
    static func == (lhs: WebView, rhs: WebView) -> Bool {
        lhs.task == rhs.task
    }

    // MARK: - Properties

    let task: WebViewTask
    let didFinish: (_ url: String?) -> Void

    // MARK: - Functions

    func makeCoordinator() -> WebViewCoordinator {
        WebViewCoordinator(task: task, didFinish: didFinish)
    }

    public func makeUIView(context: Context) -> WKWebView {
        let uiView = WKWebView()
        return uiView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        context.coordinator.didFinish = didFinish
        context.coordinator.task = task
        context.coordinator.executeTask(uiView)
    }

}

class WebViewCoordinator: NSObject, WKNavigationDelegate {
    internal init(task: WebViewTask, didFinish: @escaping (String?) -> Void, currentUrl: String? = nil) {
        self.task = task
        self.didFinish = didFinish
        self.currentUrl = currentUrl
    }

    var task: WebViewTask
    var didFinish: (_ url: String?) -> Void

    private var currentUrl: String?

    func executeTask(_ webView: WKWebView) {
        webView.navigationDelegate = self
        webView.loadHTMLString("", baseURL: nil)
        switch task {
        case .request(let uRLRequest):
            webView.load(uRLRequest)
        case .loadHTMLString(let html, let baseURL):
            webView.loadHTMLString(html, baseURL: baseURL)
        }
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        didFinish(self.currentUrl)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: ((WKNavigationActionPolicy) -> Void)) {
        currentUrl = navigationAction.request.url?.absoluteString
        decisionHandler(.allow)
        if navigationAction.navigationType == .linkActivated {
            guard let url = navigationAction.request.url else {return}
            webView.load(URLRequest(url: url))
        }
    }
}
