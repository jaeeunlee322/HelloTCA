//
//  HelloTCAApp.swift
//  HelloTCA
//
//  Created by 이재은(Lee, Jaeeun) on 2023/07/04.
//

import SwiftUI
import ComposableArchitecture

@main
struct HelloTCAApp: App {
    static let store = Store(initialState: CounterFeature.State()) {
        CounterFeature()
            ._printChanges()
    }

    var body: some Scene {
        WindowGroup {
            CounterView(store: HelloTCAApp.store)
        }
    }
}
