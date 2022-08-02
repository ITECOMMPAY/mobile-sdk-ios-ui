//
//  BottomCardView.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 23.06.2022.
//

import SwiftUI
import Combine

struct BottomCardView<Content: View>: View {
    let content: Content
    var cardShown: Bool
    let screenProportion: CGFloat

    @State private var fixedAreaHeight: CGFloat = 40
    @State private var scrollableAreaHeight: CGFloat = 40
    @State private var allHeight: CGFloat = 40

    init(cardShown: Bool = false,
         screenProportion: CGFloat = 0.9,
         @ViewBuilder content: () -> Content) {
        self.cardShown = cardShown
        self.screenProportion = screenProportion
        self.content = content()
    }

    private var cardHeight: CGFloat {
        return allHeight * screenProportion
    }

    var body: some View {
        ZStack {
            GeometryReader { reader in
                Spacer().onAppear {
                    allHeight = reader.size.height
                }
            }.background(UIScheme.color.dimming)
                .opacity(cardShown ? 1 : 0)
                .animation(Animation.easeIn)
            VStack {
                content
                    .frame(maxHeight: cardHeight)
                    .background(UIScheme.color.mainBackground)
                    .cornerRadius(UIScheme.dimension.backgroundSheetCornerRadius, corners: [.topLeft, .topRight])
            }
            .frame(height: UIScreen.main.bounds.height, alignment: .bottom)
            .offset(y: cardOffset)
            .animation(.default.delay(0.2), value: cardOffset)
        }
        .edgesIgnoringSafeArea(.all)
    }

    var cardOffset: CGFloat {
        cardShown ? 0 : cardHeight
    }
}

struct BottomCardViewContent<Header: View, ScrollableContent: View>: View {
    let content: ScrollableContent
    let header: Header

    init(@ViewBuilder header: () -> Header,
         @ViewBuilder content: () -> ScrollableContent) {
        self.header = header()
        self.content = content()
    }

    var body: some View {
        VStack {
            header
            List {
                content
                    .buttonStyle(.plain)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: -1, trailing: 0))
            }
        }
        .background(UIScheme.color.mainBackground)
    }
}

#if DEBUG

struct BottomCardView_Previews: PreviewProvider {

    struct BottomCardViewExample: View {
        @State var cardShown: Bool = false
        @State var expanded: Bool = false

        var body: some View {
            ZStack {
                Color.red
                BottomCardView(cardShown: cardShown, screenProportion: 0.9) {
                    BottomCardViewContent {
                        HStack {
                            Text("Screen header").font(UIScheme.font.screenHeader).padding()
                            Spacer()
                            CloseButton {
                                cardShown = false
                            }.padding()
                        }.padding()
                        RedactedView().frame(height: 100)
                        PaymentMethodCell(methodTitle: "Test", methodImage: IR.alipay.image, isExpanded: expanded, content: RedactedView().frame(height: 100)) {
                            expanded.toggle()
                        }
                    } content: {
                        RedactedView().frame(height: 50).padding(2)
                        RedactedView().frame(height: 50).padding(2)
                        RedactedView().frame(height: 50).padding(2)
                    }
                }.onAppear {
                    cardShown = true
                }
            }
        }
    }

    static var previews: some View {
        BottomCardViewExample()
            .edgesIgnoringSafeArea(.all)
            .previewDisplayName("Fixed")
    }
}

#endif
