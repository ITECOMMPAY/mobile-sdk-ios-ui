//
//  BottomCardView.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 23.06.2022.
//

import SwiftUI
import Combine

struct BottomCardView<Header: View, Content: View>: View {
    let content: Content
    let header: Header
    var sizingBehavior: SizingBehavior

    enum SizingBehavior {
        case proportionalToScreen(CGFloat)
        case wrapContent
    }

    var cardShown: Bool

    @State private var fixedAreaHeight: CGFloat = 40
    @State private var scrollableAreaHeight: CGFloat = 40
    @State private var allHeight: CGFloat = 40

    init(cardShown: Bool = false, sizingBehavior: SizingBehavior = .proportionalToScreen(0.9),
         @ViewBuilder header: () -> Header,
         @ViewBuilder content: () -> Content) {
        self.cardShown = cardShown
        self.sizingBehavior = sizingBehavior
        self.header = header()
        self.content = content()
    }

    private var contentHeight: CGFloat {
        return fixedAreaHeight + scrollableAreaHeight
    }

    private var cardHeight: CGFloat {
        switch sizingBehavior {
        case .proportionalToScreen(let ratio):
            return UIScreen.main.bounds.height * ratio
        case .wrapContent:
            return min(allHeight * 0.9, contentHeight)
        }
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
                VStack {
                    header.background(GeometryReader { geo in
                        Color.clear.onAppear {
                            fixedAreaHeight = geo.size.height
                        }
                    })
                    List {
                        content
                            .buttonStyle(.plain)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: -1, trailing: 0))
                            .background(GeometryReader { geo in
                            Color.clear.onAppear {
                                scrollableAreaHeight = geo.size.height
                            }
                        })
                    }
                }
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

#if DEBUG

struct BottomCardView_Previews: PreviewProvider {

    struct BottomCardViewExample: View {
        @State var cardShown: Bool = false
        @State var expanded: Bool = false

        var body: some View {
            ZStack {
                Color.red
                BottomCardView(cardShown: cardShown, sizingBehavior: .proportionalToScreen(0.9)) {
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

    static var previews: some View {
        BottomCardViewExample()
            .edgesIgnoringSafeArea(.all)
            .previewDisplayName("Fixed")
    }
}

#endif
