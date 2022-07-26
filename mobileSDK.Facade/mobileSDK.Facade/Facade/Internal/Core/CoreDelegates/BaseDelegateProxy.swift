//
//  BaseDelegateProxy.swift
//  ecommpaySDK
//
//  Created by Ivan Krapivev on 21.07.2022.
//

import Combine
import Foundation

class BaseDelegateProxy<DelegateType, EventsType, ErrorType: Error>: NSObject {
    private(set) var promise: Future<EventsType, ErrorType>.Promise?

    func createPublisher(with task: @escaping (DelegateType) -> Void) -> AnyPublisher<EventsType, ErrorType> {
        return Future { promise in
            self.promise = promise
            task(self as! DelegateType)
        }.eraseToAnyPublisher()
    }
}
