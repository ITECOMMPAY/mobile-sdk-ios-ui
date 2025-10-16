//
//  BaseDelegateProxy.swift
//  mglwalletSDK
//
//  Created by Ivan Krapivtsev on 21.07.2022.
//

import Combine
import Foundation

/// Base class for delegate proxy, uses Future as subject that forwards delegate method invocation to publisher's events
/// Subclasses should override delegate property
class BaseFutureDelegateProxy<DelegateType, EventsType, ErrorType: Error>: NSObject {

    private(set) var promise: Future<EventsType, ErrorType>.Promise?

    func createPublisher(with task: @escaping (DelegateType) -> Void) -> AnyPublisher<EventsType, ErrorType> {
        return Future { promise in
            self.promise = promise
            task(self.delegate)
        }.eraseToAnyPublisher()
    }

    /// Should be implemented by descendants
    var delegate: DelegateType {
        abort()
    }
}

class BasePassthroughDelegateProxy<DelegateType, EventsType, ErrorType: Error>: NSObject {
    private var subscriber: AnySubscriber<EventsType, ErrorType>?

    func send(_ result: Result<EventsType, ErrorType>) {
        switch result {
        case .failure(let failure):
            subscriber?.receive(completion: .failure(failure))
        case .success(let value):
            _ = subscriber?.receive(value)
        }
    }

    func createPublisher(with task: @escaping (DelegateType) -> Void) -> AnyPublisher<EventsType, ErrorType> {
        return AnyPublisher<EventsType, ErrorType>.create { subscriber in
            self.subscriber = subscriber
            task(self as! DelegateType)
        }
    }

    /// Should be implemented by descendants
    var delegate: DelegateType {
        abort()
    }
}

extension Publishers {

    struct Anonymous<Output, Failure: Swift.Error>: Publisher {
        private var closure: (AnySubscriber<Output, Failure>) -> Void

        public init(closure: @escaping (AnySubscriber<Output, Failure>) -> Void) {
            self.closure = closure
        }

        public func receive<S>(subscriber: S) where S: Subscriber, Anonymous.Failure == S.Failure, Anonymous.Output == S.Input {
            let subscription = Subscriptions.Anonymous(subscriber: subscriber)
            subscriber.receive(subscription: subscription)
            subscription.start(closure)
        }
    }
}

extension Subscriptions {

    final class Anonymous<SubscriberType: Subscriber, Output, Failure>: Subscription where SubscriberType.Input == Output, Failure == SubscriberType.Failure {

        private var subscriber: SubscriberType?

        init(subscriber: SubscriberType) {
            self.subscriber = subscriber
        }

        func start(_ closure: @escaping (AnySubscriber<Output, Failure>) -> Void) {
            if let subscriber = subscriber {
                closure(AnySubscriber(subscriber))
            }
        }

        func request(_ demand: Subscribers.Demand) {
            // Ignore demand for now
        }

        func cancel() {
            self.subscriber = nil
        }

    }

}

extension AnyPublisher {

    static func create(_ closure: @escaping (AnySubscriber<Output, Failure>) -> Void) -> AnyPublisher<Output, Failure> {
        return Publishers.Anonymous<Output, Failure>(closure: closure)
            .eraseToAnyPublisher()
    }

}
