//
//  ResultDeclineScreen.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 10.08.2022.
//

import SwiftUI

struct ResultDeclineScreen<VM: ResultDeclineScreenViewModelProtocol>: View, ViewWithViewModel {
    @ObservedObject var viewModel: VM

    var body: some View {
        BottomCardViewContent {
            EmptyView()
        } content: {
            VStack(spacing: UIScheme.dimension.middleSpacing) {
                ZStack {
                    IR.errorLogo.image
                    ZStack {
                        CloseButton {
                            viewModel.dispatch(intent: .close)
                        }
                    }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                }.frame(height: 58)
                Text(L.title_result_error_payment.string)
                    .font(UIScheme.font.commonRegular(size: UIScheme.dimension.biggerFont))
                    .foregroundColor(UIScheme.color.text)
                if let paymentMessage = payment?.paymentMassage, !paymentMessage.isEmpty {
                    Text(paymentMessage)
                    .font(UIScheme.font.commonRegular(size: UIScheme.dimension.smallFont))
                    .foregroundColor(UIScheme.color.errorTextColor)
                }
                PaymentOverview(isVatIncluded: viewModel.state.isVatIncluded,
                                priceValue: viewModel.state.paymentOptions.summary.value,
                                currency: viewModel.state.paymentOptions.summary.currency,
                                backgroundTemplate: UIScheme.infoCardBackground,
                                logoImage: viewModel.state.paymentOptions.summary.logo)
                ResultTableInfo(resultInfoKeyValuePairs: [
                    (L.title_card_wallet.rawValue, valueTitleCardWallet),
                    (L.title_payment_id.rawValue, payment?.id ?? ""),
                    ( L.title_payment_date.rawValue, payment?.date ?? "")
                ] + completeFields)
                PolicyView()
                FooterView()
            }
            .padding([.horizontal, .bottom], UIScheme.dimension.paymentDetailsSpacing)
            .padding([.top], UIScheme.dimension.largeSpacing)
            .frame(maxWidth: .infinity)
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
