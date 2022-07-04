//
//  BottomCardView.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 23.06.2022.
//

import SwiftUI

struct BottomCardView<Header: View, Content: View>: View {
    let content: Content
    let header: Header
    var sizingBehavior: SizingBehavior

    enum SizingBehavior {
        case proportionalToScreen(CGFloat)
        case wrapContent
    }

    @State var cardShown: Bool = false
    @State var cardDismissal: Bool = false

    @State private var fixedAreaHeight: CGFloat = 40
    @State private var scrolableAreaHeight: CGFloat = 40

    init(sizingBehavior: SizingBehavior = .proportionalToScreen(0.75),
         @ViewBuilder header: () -> Header,
         @ViewBuilder content: () -> Content) {
        self.sizingBehavior = sizingBehavior
        self.header = header()
        self.content = content()
    }

    private var contentHeight: CGFloat {
        return fixedAreaHeight + scrolableAreaHeight
    }

    private var cardHeight: CGFloat {
        switch (sizingBehavior) {
        case .proportionalToScreen(let ratio):
            return UIScreen.main.bounds.height * ratio
        case .wrapContent:
            return min(UIScreen.main.bounds.height * 0.9, contentHeight)
        }
    }

    var body: some View {
        ZStack {
            GeometryReader { _ in
                Spacer()
            }.background(UIScheme.color.dimming)
                .opacity(cardShown ? 1 : 0)
                .animation(Animation.easeIn)
                .onTapGesture {
                    dissmiss()
                }
            VStack {
                VStack {
                    VStack {
                        header
                    }.overlay(GeometryReader { geo -> Color in
                        DispatchQueue.main.async {
                            fixedAreaHeight = geo.size.height
                        }
                        return Color.clear
                    })
                    ScrollView {
                        content.overlay(GeometryReader { geo -> Color in
                            DispatchQueue.main.async {
                                scrolableAreaHeight = geo.size.height
                            }
                            return Color.clear
                        })
                    }
                }
                .frame(maxHeight: cardHeight)
                .background(UIScheme.color.mainBackground)
                .cornerRadius(UIScheme.dimension.backgroundSheetCornerRadius, corners: [.topLeft, .topRight])
            }
            .frame(height: UIScreen.main.bounds.height, alignment: .bottom)
            .offset(y: cardShown && cardDismissal ? 0 : cardHeight)
            .animation(Animation.default.delay(0.2))
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            dissmiss()
        }
    }

    func dissmiss() {
        cardDismissal.toggle()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.25) {
            cardShown.toggle()
        }
    }
}

#if DEBUG

struct BottomCardView_Previews: PreviewProvider {
    static var previews: some View {

            ZStack {
                Color.red
                BottomCardView(sizingBehavior: .proportionalToScreen(0.9)) {
                    Text("Screen header").font(UIScheme.font.screenHeader)
                    RedactedView().frame(height: 100)
                } content: {
                    RedactedView().frame(height: 50)
                    RedactedView().frame(height: 50)
                    RedactedView().frame(height: 50)
                }

            }.edgesIgnoringSafeArea(.all)
                .previewDisplayName("Fixed")
    }
}

#endif

