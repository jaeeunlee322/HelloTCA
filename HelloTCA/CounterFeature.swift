//
//  CounterFeature.swift
//  HelloTCA
//
//  Created by 이재은(Lee, Jaeeun) on 2023/07/04.
//

import Foundation
import ComposableArchitecture

struct CounterFeature: ReducerProtocol {
    struct State: Equatable {
        var count = 0
    }

    enum Action {
        case decrementButtonTapped
        case incrementButtonTapped
    }

    func reduce(into state: inout State,
                action: Action) -> EffectTask<Action> {
        switch action {
        case .decrementButtonTapped:
            state.count -= 1
            return .none
        case .incrementButtonTapped:
            state.count += 1
            return .none
        }
    }
}
