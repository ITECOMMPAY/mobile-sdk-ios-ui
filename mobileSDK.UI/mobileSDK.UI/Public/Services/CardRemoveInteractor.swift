//
//  CardRemoveInteractor.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 31.08.2022.
//

import Combine

public protocol CardRemoveInteractor {
    func remove(card: SavedAccount) -> AnyPublisher<Bool, CoreError>
}
