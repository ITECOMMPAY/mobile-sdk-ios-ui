//
//  CardRemoveWrapper.swift
//  ecommpaySDK
//
//  Created by Ivan Krapivtsev on 30.08.2022.
//

import mobileSDK_UI
import MsdkCore
import Combine

struct CardRemoveInteractorWrapper {
    weak var session: MSDKCoreSession?

    private var interactor: MsdkCore.CardRemoveInteractor? {
        return session?.getCardRemoveInteractor()
    }

    init(msdkSession: MSDKCoreSession?) {
        self.session = msdkSession
    }
}

extension CardRemoveInteractorWrapper: mobileSDK_UI.CardRemoveInteractor {
    func remove(card: mobileSDK_UI.SavedAccount) -> AnyPublisher<Bool, CoreError> {
        guard let interactor = interactor
        else {
            return Fail(error: CoreError(code: .unknown, message: "pay interactor is not presented"))
                .eraseToAnyPublisher()
        }

        let request = CardRemoveRequest(id: card.id)

        let delegateProxy = CardRemoveDelegateProxy()

        return delegateProxy.createPublisher(with: { delegate in
            interactor.execute(request: request, callback: delegate)
        }).eraseToAnyPublisher()
    }
}

fileprivate class CardRemoveDelegateProxy: BaseFutureDelegateProxy<CardRemoveDelegate, Bool, CoreError> {
    override var delegate: CardRemoveDelegate { self }
}

extension CardRemoveDelegateProxy: CardRemoveDelegate {
    func onError(code: ErrorCode, message: String) {
        promise?(.failure(CoreError(code: CoreErrorCode.createFrom(code: code), message: message)))
    }

    func onSuccess(result: Bool) {
        promise?(.success(result))
    }

}
