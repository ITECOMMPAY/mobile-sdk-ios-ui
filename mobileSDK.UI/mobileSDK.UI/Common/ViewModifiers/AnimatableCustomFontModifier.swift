//
//  AnimatableCustomFontModifier.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 13.07.2022.
//

import SwiftUI

/// A view modifier that makes the view's font size animatable.
///
/// Inspired by Paul Hudson's <https://www.hackingwithswift.com/quick-start/swiftui/how-to-animate-the-size-of-text>
struct AnimatableCustomFontModifier: AnimatableModifier {

    // MARK: - Properties

    /// The font size.
    var size: CGFloat
    var makeFont: (CGFloat) -> Font

    // MARK: AnimatableModifier protocol properties

    var animatableData: CGFloat {
        get { size }
        set { size = newValue }
    }

    // MARK: - Methods

    // MARK: AnimatableModifier protocol methods

    func body(content: Content) -> some View {
        content
            .font(makeFont(size))
    }

}

// MARK: -

extension View {

    // MARK: - Methods

    /// Sets the default font for text in the view and makes its change animatable.
    /// - Parameter size: The size of the font.
    /// - Returns: The view with this modification applied.
    func animatableFont(size: CGFloat, makeFont: @escaping (CGFloat) -> Font) -> some View {
        modifier(AnimatableCustomFontModifier(size: size, makeFont: makeFont))
    }

}

// MARK: - Preview

#if DEBUG

struct ExampleView: View {
    @State private var fontSize = 1.0

    var body: some View {
        Text("Hello, World!")
            .font(.system(size: 12))
            .scaleEffect(fontSize)
            .onTapGesture {
                withAnimation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 1).repeatForever()) {
                    fontSize = 2.0
                }
            }
    }
}

struct AnimatableCustomFontModifier_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
    }
}

#endif
