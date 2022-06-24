//
//  ShrinkView.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 14.06.2022.
//

import SwiftUI

struct HeightPreferenceKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue: CGFloat = 40
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
struct FittedScrollView: View {
    static func newString() -> String { String(repeating: "Hello World! ", count: Int.random(in: 1..<135)) }
    @State private var contentString = Self.newString()
    @State private var contentHeight: CGFloat = 40
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    Button("Next Text", action: { contentString = Self.newString() })
                    Text(contentString)
                        .padding(20)
                }
                .overlay(
                    GeometryReader { geo in
                        Color.clear.preference(key: HeightPreferenceKey.self, value: geo.size.height)
                    })
            }
            .frame(maxHeight: contentHeight, alignment: .bottom)
            .padding(20)
            .background(RoundedRectangle(cornerRadius: 20).stroke(Color(white: 0.4), lineWidth: 3))
            .background(RoundedRectangle(cornerRadius: 20).fill(Color(white: 0.8)))
        }
        .frame(height: 400, alignment: .bottom)
        .onPreferenceChange(HeightPreferenceKey.self) {
            contentHeight = $0
        }
    }
}

struct ShrinkView_Previews: PreviewProvider {
    static var previews: some View {
        FittedScrollView()
    }
}

