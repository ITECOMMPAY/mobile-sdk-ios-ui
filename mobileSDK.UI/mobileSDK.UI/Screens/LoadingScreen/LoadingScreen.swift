//
//  LoadingScreen.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 09.08.2022.
//

import Foundation
import SwiftUI

struct LoadingScreen: View {
    public var body: some View {
        VStack {
            Spacer()
            VStack(spacing: UIScheme.dimension.middleSpacing) {
                AnimatedDots().padding(.bottom, UIScheme.dimension.middleSpacing)
                Text(L.title_loading_screen.string)
                    .font(UIScheme.font.commonRegular(size: UIScheme.dimension.biggerFont))
                    .foregroundColor(UIScheme.color.text)
                Text(L.sub_title_loading_screen.string)
                    .font(UIScheme.font.commonRegular(size: UIScheme.dimension.smallFont))
                    .foregroundColor(UIScheme.color.text)
            }
            Spacer()
            FooterView().padding(.bottom, UIScheme.dimension.largeSpacing)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, UIScheme.dimension.largeSpacing)
    }
}

struct AnimatedDots: View {
    let dotSize: CGFloat = 12
    var dotInterval: CGFloat { dotSize}
    let numberOfDots = 3
    var amplitude: CGFloat { -dotSize * 1.5 }


    let delay: TimeInterval = 0.15
    let timerDuration: TimeInterval = 0.75
    let animationDuration: TimeInterval = 0.55

    @State var isAnimation = false
    @State var timer: Timer?

    var body: some View {
        HStack(alignment: .center, spacing: dotInterval){
            ForEach(0 ..< numberOfDots, id:\.self) { i in
                dot
                    .offset(y: isAnimation ? amplitude : 0)
                    .animation(animation.delay(Double(i) * delay), value: isAnimation)
            }
        }.onAppear {
            timer = Timer.scheduledTimer(withTimeInterval: timerDuration, repeats: true) { timer in
                isAnimation.toggle()
            }
        }
    }

    var animation: Animation {
        animation(withDuration: animationDuration)
    }

    func animation(withDuration duration: CGFloat) -> Animation {
        Animation.timingCurve(0.3, 0.3, 0.3, 1, duration: duration)
    }

    var dot: some View  {
        Circle()
            .fill(UIScheme.color.brandColor)
            .frame(width: dotSize, height: dotSize, alignment: .center)
    }
}

#if DEBUG

struct LoadingScreen_Previews: PreviewProvider {

    static var previews: some View {
        LoadingScreen()
    }
}

#endif
