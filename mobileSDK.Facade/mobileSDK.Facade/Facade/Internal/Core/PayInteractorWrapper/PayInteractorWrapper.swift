//
//  PayInteractorWrapper.swift
//  ecommpaySDK
//
//  Created by Ivan Krapivtsev on 25.07.2022.
//


#if !DEVELOPMENT
@_implementationOnly import mobileSDK_UI
@_implementationOnly import MsdkCore
#else
import mobileSDK_UI
import MsdkCore
#endif
import Combine

struct PayInteractorWrapper {
    weak var msdkSession: MSDKCoreSession?

    private var payInteractor: MsdkCore.PayInteractor? {
        return msdkSession?.getPayInteractor()
    }

    init(msdkSession: MSDKCoreSession?) {
        self.msdkSession = msdkSession
    }
}

extension PayInteractorWrapper: mobileSDK_UI.PayInteractor {

    func execute(request: mobileSDK_UI.PayRequest) -> AnyPublisher<PayEvent, CoreError> {
        guard let interactor = payInteractor
        else {
            return Fail(error: CoreError(code: .unknown, message: "pay interactor is not presented"))
                .eraseToAnyPublisher()
        }

        guard let requestWrapper = request as? PayRequestWrapper
        else {
            return Fail(error: CoreError(code: .unknown, message: "request is not PayRequestWrapper"))
                .eraseToAnyPublisher()
        }
        let delegateProxy = PayDelegateProxy()

        return delegateProxy.createPublisher(with: { delegate in
            interactor.execute(request: requestWrapper.coreRequest, callback: delegate)
        }).eraseToAnyPublisher()
    }

    func sendCustomerFields(fieldsValues: [mobileSDK_UI.FieldValue]) {
        payInteractor?.sendCustomerFields(
            fields: fieldsValues.map {
                MsdkCore.CustomerFieldValue(name: $0.name, value: $0.value)
            }
        )
    }

    func sendClarificationFields(fieldsValues: [mobileSDK_UI.FieldValue]) {
        payInteractor?.sendClarificationFields(
            fields: fieldsValues.map {
                MsdkCore.ClarificationFieldValue(name: $0.name, value: $0.value)
            }
        )
    }

    func threeDSecureHandled() {
        payInteractor?.threeDSecureHandled()
    }
}
