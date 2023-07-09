//
//  HelloContactsApp.swift
//  HelloContacts
//
//  Created by 이재은 on 2023/07/10.
//

import SwiftUI
import ComposableArchitecture

@main
struct HelloContactsApp: App {
    static let contactStore = Store(
        initialState: ContactsFeature.State(
            contacts: []),
               reducer: ContactsFeature()
    )

    var body: some Scene {
        WindowGroup {
            ContentView(store: HelloContactsApp.contactStore)
        }
    }
}
