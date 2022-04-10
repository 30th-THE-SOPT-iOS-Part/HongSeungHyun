//
//  Observable.swift
//  30th-assignment
//
//  Created by Noah on 2022/04/09.
//

import Foundation

@propertyWrapper
struct Observable<T> {
    private final class Store<T> {
        var actions: [(T) -> Void] = []
    }

    private let store = Store<T>()

    var projectedValue: Observable<T> { self }

    var wrappedValue: T {
        didSet { store.actions.forEach { $0(wrappedValue) } }
    }

    func bind(fire: Bool = false, action: @escaping (T) -> Void) {
        store.actions.append(action)
        if fire {
            action(wrappedValue)
        }
    }

    func dispose() {
        store.actions.removeAll()
    }

    static func dispose(_ list: [Observable]) {
        list.forEach { $0.dispose() }
    }
}
