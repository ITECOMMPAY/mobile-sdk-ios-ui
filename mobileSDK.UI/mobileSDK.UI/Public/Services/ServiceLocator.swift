//
//  ServiceLocator.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 21.07.2022.
//

import Foundation

/// Convenience property wrapper access an instance of the desired type.
@propertyWrapper public struct Injected<T> {
    private var dependency: T?
    public init() {
        self.dependency = serviceLocator.getService()
    }
    public var wrappedValue: T? {
        get { return dependency }
        mutating set { dependency = newValue }
    }
}

public let serviceLocator = LazyServiceLocator()

protocol ServiceLocator: ObservableObject {
    func getService<T>() -> T?
}

extension ServiceLocator {
    func getService<T>(ofType: T.Type) -> T? {
        return getService()
    }
}

public final class LazyServiceLocator: ServiceLocator {
    enum RegistryRecord {
        case Instance(Any)
        case Recipe(() -> Any)

        func unwrap() -> Any {
            switch self {
            case .Instance(let instance):
                return instance
            case .Recipe(let recipe):
                return recipe()
            }
        }
    }

    private lazy var registry: [String: RegistryRecord] = [:]

    private func typeName(some: Any) -> String {
        return (some is Any.Type) ? "\(some)" : "\(type(of: some))"
    }

    func addService<T>(recipe: @escaping () -> T) {
        objectWillChange.send()
        let key = typeName(some: T.self)
        registry[key] = .Recipe(recipe)
    }

    public func addService<T>(instance: T) {
        objectWillChange.send()
        let key = typeName(some: T.self)
        registry[key] = .Instance(instance)
        debugPrint("Service added to Registry: \(key) / \(typeName(some: instance))")
    }

    func getService<T>() -> T? {
        let key = typeName(some: T.self)
        var instance: T?
        if let registryRecord = registry[key] {
            instance = registryRecord.unwrap() as? T

            switch registryRecord {
            case .Recipe:
                if let instance = instance {
                    addService(instance: instance)
                }
            case .Instance:
                break
            }
        }
        return instance
    }
}
