//
//  AddContactsFeature.swift
//  ContactNavigationTutorial
//
//  Created by 김동준 on 1/21/24
//

import Foundation
import ComposableArchitecture

@Reducer
struct AddContactsFeature {
    struct State: Equatable {
        var contact: Contact
    }
    
    enum Action {
        case cancelButtonTapped
        case saveButtonTapped
        case setName(String)
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .cancelButtonTapped:
                return .none
            case .saveButtonTapped:
                return .none
            case .setName(let name):
                state.contact.name = name
                return .none
            }
        }
    }
}
