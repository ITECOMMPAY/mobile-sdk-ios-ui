//
//  ExpandingTextView.swift
//  EcommpaySample
//
//  Created by Ivan Krapivtsev on 01.11.2022.
//

import SwiftUI

#if DEBUG

struct ExpandingTextView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Form {
                ExpandingTextView(text: .mutable("some text"))
            }
        }
    }
}

#endif

extension Binding {
    static func mutable(_ value: Value) -> Binding<Value> {
        var mutableValue: Value = value
        return Binding {
            mutableValue
        } set: { newValue in
            mutableValue = newValue
        }
    }
}

struct WrappedTextView: UIViewRepresentable {
    typealias UIViewType = UITextView

    @Binding var text: String
    let textDidChange: (UITextView) -> Void

    func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
        view.isEditable = true
        view.delegate = context.coordinator
        return view
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = self.text
        DispatchQueue.main.async {
            self.textDidChange(uiView)
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text, textDidChange: textDidChange)
    }

    class Coordinator: NSObject, UITextViewDelegate {
        @Binding var text: String
        let textDidChange: (UITextView) -> Void

        init(text: Binding<String>, textDidChange: @escaping (UITextView) -> Void) {
            self._text = text
            self.textDidChange = textDidChange
        }

        func textViewDidChange(_ textView: UITextView) {
            self.text = textView.text
            self.textDidChange(textView)
        }
    }
}

struct ExpandingTextView: View {
    @Binding var text: String
    let minHeight: CGFloat = 50
    @State private var height: CGFloat?

    var body: some View {
        WrappedTextView(text: $text, textDidChange: self.textDidChange)
            .frame(height: height ?? minHeight)
    }

    private func textDidChange(_ textView: UITextView) {
        self.height = max(textView.contentSize.height, minHeight)
    }
}
