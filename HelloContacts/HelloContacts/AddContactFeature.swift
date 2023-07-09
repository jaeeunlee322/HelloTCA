//
//  AddContactFeature.swift
//  HelloContacts
//
//  Created by 이재은 on 2023/07/10.
//

import Foundation
import ComposableArchitecture

struct AddContactFeature: ReducerProtocol {
    struct State: Equatable {
        var contact: Contact
    }

    enum Action { //}: Equatable {
//        static func == (lhs: AddContactFeature.Action, rhs: AddContactFeature.Action) -> Bool {
//            <#code#>
//        }

        case cancelButtonTapped
        case delegate(Delegate)
        case saveButtonTapped
        case setName(String)

        enum Delegate {
            case cancel
            case saveContact(Contact)
        }
    }

    @Dependency(\.dismiss) var dismiss
    func reduce(into state: inout State,
                action: Action) -> EffectTask<Action> {
        switch action {
        case .cancelButtonTapped:
            return .run { _ in await self.dismiss() }

        case .delegate:
            return .none

        case .saveButtonTapped:
            return .run { [contact = state.contact] send in
                await send(.delegate(.saveContact(contact)))
                await self.dismiss()
            }

        case let .setName(name):
            state.contact.name = name
            return .none
        }
    }
}
