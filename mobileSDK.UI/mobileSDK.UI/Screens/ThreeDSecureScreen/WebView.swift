//
//  ACSView.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 15.08.2022.
//

import SwiftUI
import WebKit

public struct WebView: UIViewRepresentable {
    public init(configuration: @escaping (WKWebView) -> Void = { _ in }) {
            self.configuration = configuration
    }

    // MARK: - Properties

    private let configuration: (WKWebView) -> Void

    // MARK: - Functions

    public func makeUIView(context: Context) -> WKWebView {
        makeView()
    }

    public func updateUIView(_ uiView: WKWebView, context: Context) {}
}

private extension WebView {
    func makeView() -> WKWebView {
        let view = WKWebView()
        configuration(view)
        return view
    }
}

#if DEBUG

struct Previews_WebView_Previews: PreviewProvider {

    static var previews: some View {
        if let url = URL(string: "https://ecommpay.com/ru/") {
            WebView(configuration: { webView in
                webView.load(URLRequest(url: url))
            }).previewLayout(.sizeThatFits)
        } else {
            Color.orange
        }
    }
}
#endif
