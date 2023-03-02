//
//  BottomCardView.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 23.06.2022.
//

import SwiftUI
import Combine

struct BottomCardView<Content: View>: View {
    let content: Content
    var cardShown: Bool
    let dissmissClosure: () -> Void
    let screenProportion: CGFloat

    @State private var allHeight: CGFloat = UIScreen.main.bounds.height

    init(cardShown: Bool = false,
         screenProportion: CGFloat = 0.9,
         dissmissClosure: @escaping () -> Void = {},
         @ViewBuilder content: () -> Content) {
        self.cardShown = cardShown
        self.screenProportion = screenProportion
        self.dissmissClosure = dissmissClosure
        self.content = content()
    }

    private var spacerHeight: CGFloat {
        return allHeight * (1.0 - screenProportion)
    }

    var body: some View {
        ZStack {
            GeometryReader { reader in
                Spacer().onAppear {
                    allHeight = reader.size.height
                }.ignoresSafeArea()
            }.background(UIScheme.color.dimming)
                .opacity(cardShown ? 1 : 0)
                .animation(Animation.easeIn)
                .ignoresSafeArea()
                .onTapGesture {
                    dissmissClosure()
                }
            VStack(spacing: .zero) {
                Spacer().frame(height: spacerHeight + cardOffset)
                content
                    .background(UIScheme.color.mainBackground)
                    .cornerRadius(UIScheme.dimension.backgroundSheetCornerRadius, corners: [.topLeft, .topRight])
                    .frame(maxHeight: cardShown ? .infinity : 0)
            }
            .animation(.default, value: cardOffset)
        }.ignoresSafeArea()
    }

    var cardOffset: CGFloat {
        cardShown ? 0 : allHeight
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
        VStack(spacing: .zero) {
            header
            if #available(iOS 15.0, *) {
                List {
                    content
                        .buttonStyle(.plain)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .listRowSeparator(.hidden)
                        .listRowBackground(UIScheme.color.mainBackground)
                }
            } else {
                List {
                    content
                        .buttonStyle(.plain)
                        .listRowInsets(EdgeInsets(top: -1, leading: 0, bottom: -1, trailing: 0))
                        .listRowBackground(UIScheme.color.mainBackground)
                }
            }
        }
        .keyboardAwarePadding()
        .listStyle(.plain)
    }
}

struct KeyboardAwareModifier: ViewModifier {
    @State private var keyboardHeight: CGFloat = 0

    private var keyboardHeightPublisher: AnyPublisher<CGFloat, Never> {
        Publishers.Merge(
            NotificationCenter.default
                .publisher(for: UIResponder.keyboardWillShowNotification)
                .compactMap { $0.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue }
                .map { $0.cgRectValue.height },
            NotificationCenter.default
                .publisher(for: UIResponder.keyboardWillHideNotification)
                .map { _ in CGFloat(0) }
        ).eraseToAnyPublisher()
    }

    func body(content: Content) -> some View {
        content
            .padding(.bottom, keyboardHeight)
            .onReceive(keyboardHeightPublisher) { self.keyboardHeight = $0 }
    }
}

extension View {
    func keyboardAwarePadding() -> some View {
        ModifiedContent(content: self, modifier: KeyboardAwareModifier())
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
                        PaymentMethodCell(methodTitle: "Test", methodImage: IR.bankCard.image, isExpanded: expanded, content: RedactedView().frame(height: 100)) {
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
            .ignoresSafeArea()
            .previewDisplayName("Fixed")
    }
}

#endif
