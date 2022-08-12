//
//  ResultSuccessScreen.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 10.08.2022.
//

import SwiftUI

struct ResultSuccessScreen<VM: ResultSuccessScreenViewModelProtocol>: View, ViewWithViewModel {
    var viewModel: VM

    var body: some View {
        BottomCardViewContent {
            EmptyView()
        } content: {
            VStack(spacing: UIScheme.dimension.middleSpacing) {
                ZStack {
                    IR.successLogo.image
                    HStack(alignment: .top) {
                        Spacer()
                        CloseButton {
                            viewModel.dispatch(intent: .close)
                        }
                    }.frame(maxWidth: .infinity, maxHeight: .infinity)
                }.frame(height: 58)
                Text(L.title_result_succes_payment.string)
                    .font(UIScheme.font.commonRegular(size: UIScheme.dimension.biggerFont))
                    .foregroundColor(UIScheme.color.text)
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
                .cornerRadius(UIScheme.dimension.backgroundSheetCornerRadius, corners: .allCorners)
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
        case .unknown:
            return payment.paymentAccount?.type ?? ""
        default:
            return paymentMethod.translations["title"] ?? ""
        }
    }

    private var completeFields: [(String?, String?)] {
        return payment?.paymentCompleteFields?.map { completeField in
            let translation = completeField.name != nil ? TranslationsManager.shared.stringValue(for: completeField.name!) : completeField.defaultLabel
            return (translation ?? completeField.defaultLabel, completeField.value)
        } ?? []
    }
}

// TODO: Make preview
/*
struct ResultSuccessScreen_Previews: PreviewProvider {

    class MockRootViewModel: RootViewModelProtocol {
        func dispatch(intent: RootIntent) {
            <#code#>
        }

        var state: RootState = RootState(isLoading: <#T##Bool#>,
                                         currentScreen: <#T##SDKScreen#>,
                                         currentMethod: <#T##PaymentMethodsListEntity?#>,
                                         payment: <#T##Payment?#>,
                                         customerFields: <#T##[CustomerField]?#>, clarificationFields: <#T##[ClarificationField]?#>,
                                         error: <#T##CoreError?#>, savedAccounts: <#T##[SavedAccount]?#>,
                                         availablePaymentMethods: <#T##[PaymentMethod]?#>,
                                         paymentOptions: <#T##PaymentOptions#>)
    }

    static var previews: some View {

        ResultSuccessScreen(viewModel: ResultSuccessScreenViewModel(parentViewModel: ))
    }

}
 */

enum ResultSuccessScreenIntent {
    case close
}

protocol ResultSuccessScreenState {
    var paymentOptions: PaymentOptions { get }
    var currentPaymentMethod: PaymentMethod? { get }
    var payment: Payment? { get }
    var finalPaymentState: FinalPaymentState? { get }
    var isVatIncluded: Bool { get }
}

protocol ResultSuccessScreenViewModelProtocol: ViewModel
where UserIntent == ResultSuccessScreenIntent,
      ViewState == ResultSuccessScreenState {}

class ResultSuccessScreenViewModel<rootVM: RootViewModelProtocol>: ChildViewModel<ResultSuccessScreenState, ResultSuccessScreenIntent, rootVM>, ResultSuccessScreenViewModelProtocol {
    override func mapState(from parentState: RootState) throws -> ResultSuccessScreenState {
        parentState as ResultSuccessScreenState
    }

    override func mapIntent(from childIntent: ResultSuccessScreenIntent) throws -> RootIntent {
        .successScreenIntent(childIntent)
    }
}

extension RootState: ResultSuccessScreenState {}
