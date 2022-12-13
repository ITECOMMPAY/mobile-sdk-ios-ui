//
//  ResultDeclineScreen.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 10.08.2022.
//

import SwiftUI

private struct ResultDeclineAnimationState {
    var headerOffset: CGFloat = UIScreen.main.bounds.height*0.25
    
    var showLogo = false
    
    var titleOffset: CGFloat = 20
    var showTitle = false
    
    var overviewOffset: CGFloat = 20
    var showOverview = false
    
    var infoOffset: CGFloat = 20
    var showInfo = false
    
    var buttonOffset: CGFloat = 20
    var showButton = false
    
    var policyOffset: CGFloat = 20
    var showPolicy = false
    
    var footerOffset: CGFloat = 20
    var showFooter = false
}

struct ResultDeclineScreen<VM: ResultDeclineScreenViewModelProtocol>: View, ViewWithViewModel {
    @ObservedObject var viewModel: VM
    @State private var animationState = ResultDeclineAnimationState()

    var body: some View {
        BottomCardViewContent {
            EmptyView()
        } content: {
            VStack(spacing: UIScheme.dimension.middleSpacing) {
                VStack(spacing: UIScheme.dimension.middleSpacing) {
                    IR.errorLogo.image
                        .frame(height: 58)
                        .opacity(animationState.showLogo ? 1 : 0)
                    VStack(spacing: UIScheme.dimension.tinySpacing) {
                        Text(L.title_result_error_payment.string)
                            .font(UIScheme.font.commonRegular(size: UIScheme.dimension.biggerFont))
                            .foregroundColor(UIScheme.color.text)
                        if let paymentMessage = payment?.paymentMassage, !paymentMessage.isEmpty {
                            Text(paymentMessage)
                                .font(UIScheme.font.commonRegular(size: UIScheme.dimension.smallFont))
                                .foregroundColor(UIScheme.color.errorTextColor)
                        }
                    }
                    .offset(x: .zero, y: animationState.titleOffset)
                    .opacity(animationState.showTitle ? 1 : 0)
                }
                .offset(x: .zero, y: animationState.headerOffset)
                PaymentOverview(isVatIncluded: viewModel.state.isVatIncluded,
                                priceValue: viewModel.state.paymentOptions.summary.value,
                                currency: viewModel.state.paymentOptions.summary.currency,
                                paymentDetails: [],
                                backgroundTemplate: UIScheme.infoCardBackground,
                                logoImage: viewModel.state.paymentOptions.summary.logo)
                    .offset(x: .zero, y: animationState.overviewOffset)
                    .opacity(animationState.showOverview ? 1 : 0)
                ResultTableInfo(resultInfoKeyValuePairs: [
                    (L.title_card_wallet.rawValue, valueTitleCardWallet),
                    (L.title_payment_id.rawValue, payment?.id ?? ""),
                    (L.title_payment_date.rawValue, payment?.uiDate ?? payment?.date ?? "")
                ] + completeFields)
                    .offset(x: .zero, y: animationState.infoOffset)
                    .opacity(animationState.showInfo ? 1 : 0)
                PayButton(
                    label: PayButtonLabel(style: .Close),
                    disabled: false) {
                        viewModel.dispatch(intent: .close)
                    }
                    .offset(x: .zero, y: animationState.buttonOffset)
                    .opacity(animationState.showButton ? 1 : 0)
                PolicyView()
                    .offset(x: .zero, y: animationState.policyOffset)
                    .opacity(animationState.showPolicy ? 1 : 0)
                FooterView()
                    .offset(x: .zero, y: animationState.footerOffset)
                    .opacity(animationState.showFooter ? 1 : 0)
            }
            .padding([.horizontal, .bottom], UIScheme.dimension.paymentOverviewSpacing)
            .padding([.top], UIScheme.dimension.largeSpacing)
            .frame(maxWidth: .infinity)
            .onAppear {
                animateViews()
            }
        }
    }

    private var payment: Payment? {
        viewModel.state.payment ?? nil
    }

    private var valueTitleCardWallet: String {
        guard let payment = viewModel.state.payment else {
            assertionFailure("Not found payment in State")
            return ""
        }
        guard let paymentMethod = viewModel.state.currentPaymentMethod else {
            assertionFailure("Not method selected")
            return ""
        }

        switch paymentMethod.methodType {
        case .card:
            return "\(payment.paymentAccount?.type?.uppercased() ?? "") \(payment.paymentAccount?.number ?? "")"
        default:
            return paymentMethod.translations["title"] ?? ""
        }
    }

    private var completeFields: [(String?, String?)] {
        return payment?.paymentCompleteFields?.asTuples ?? []
    }

    private func animateViews() {
        animate {
            animationState.showLogo.toggle()
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(Animation.timingCurve(0.4, 0, 0.2, 1, duration: 0.5)) {
                animationState.titleOffset = .zero
                animationState.showTitle.toggle()
            }
        }
        
        animate(delay: 1.1) {
            animationState.headerOffset = .zero
        }
        
        animate(delay: 1.3) {
            animationState.overviewOffset = .zero
        }
        
        animate(delay: 1.4) {
            animationState.showOverview.toggle()
            animationState.infoOffset = .zero
        }
        
        
        animate(delay: 1.5) {
            animationState.showInfo.toggle()
            animationState.buttonOffset = .zero
        }

        animate(delay: 1.6) {
            animationState.showButton.toggle()
            animationState.policyOffset = .zero
        }
        
        animate(delay: 1.7) {
            animationState.showPolicy.toggle()
        }

        animate(delay: 1.65) {
            animationState.footerOffset = .zero
        }
        
        animate(delay: 1.75) {
            animationState.showFooter.toggle()
        }
    }
    
    private func animate(delay: Double = 0.0, animation: @escaping (() -> Void)) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            withAnimation(Animation.timingCurve(0.77, 0, 0.175, 1, duration: 0.5)) {
                animation()
            }
        }
    }
}

#if DEBUG

struct ResultDeclineScreen_Previews: PreviewProvider {
    static var previews: some View {
        ResultDeclineScreen(viewModel: ResultDeclineScreenViewModel(parentViewModel: MockRootViewModel(with: stateMock)))
    }
}

#endif

enum ResultDeclineScreenIntent {
    case close
}

protocol ResultDeclineScreenState {
    var paymentOptions: PaymentOptions { get }
    var currentPaymentMethod: PaymentMethod? { get }
    var payment: Payment? { get }
    var finalPaymentState: FinalPaymentState? { get }
    var isVatIncluded: Bool { get }
}

protocol ResultDeclineScreenViewModelProtocol: ViewModel
where UserIntent == ResultDeclineScreenIntent,
      ViewState == ResultDeclineScreenState {}

class ResultDeclineScreenViewModel<rootVM: RootViewModelProtocol>: ChildViewModel<ResultDeclineScreenState, ResultDeclineScreenIntent, rootVM>, ResultDeclineScreenViewModelProtocol {
    override func mapState(from parentState: RootState) throws -> ResultDeclineScreenState {
        parentState as ResultDeclineScreenState
    }

    override func mapIntent(from childIntent: ResultDeclineScreenIntent) throws -> RootIntent {
        .declineScreenIntent(childIntent)
    }
}

extension RootState: ResultDeclineScreenState {}
