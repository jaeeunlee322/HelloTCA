//
//  ContentView.swift
//  HelloContacts
//
//  Created by 이재은 on 2023/07/10.
//

import SwiftUI
import ComposableArchitecture
import SwiftUI

struct ContentView: View {
    let store: StoreOf<ContactsFeature>

    var body: some View {
        NavigationStack {
            WithViewStore(self.store,
                          observe: \.contacts) { viewStore in
                List {
                    ForEach(viewStore.state) { contact in
                        Text(contact.name)
                    }
                }
                .navigationTitle("Contacts")
                .toolbar {
                    ToolbarItem {
                        Button {
                            viewStore.send(.addButtonTapped)
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
        }
        .sheet(
            store: self.store.scope(
                state: \.$addContact,
                action: { .addContact($0) }
            )
        ) { addContactStore in
            NavigationStack {
                AddContactView(store: addContactStore)
            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(
//            store: Store(
//                initialState: ContactsFeature.State(
//                    contacts: [
//                        Contact(id: UUID(), name: "TCA")
//                        Contact(id: UUID(), name: "파이팅")
//                    ],
//                    reducer: ContactsFeature()
//                )
//            )
//        )
//    }
//}
