//
//  ContactsFeature.swift
//  ContactNavigationTutorial
//
//  Created by 김동준 on 1/21/24
//

import Foundation
import ComposableArchitecture

@Reducer
struct ContactsFeature {
    struct State: Equatable {
        var contacts: IdentifiedArrayOf<Contact> = []
        @PresentationState var addContact: AddContactsFeature.State?
    }
    
    enum Action {
        case addButtonTapped
        case addContact(PresentationAction<AddContactsFeature.Action>)
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .addButtonTapped:
                state.addContact = AddContactsFeature.State(
                    contact: Contact(id: UUID(), name: "")
                )
                return .none
            case .addContact(.presented(.cancelButtonTapped)):
                state.addContact = nil
                return .none
            case .addContact(.presented(.saveButtonTapped)):
                guard let contact = state.addContact?.contact else {
                    return .none
                }
                state.contacts.append(contact)
                state.addContact = nil
                return .none
            case .addContact:
                return .none
            }
        }
        .ifLet(\.$addContact, action: \.addContact) {
            AddContactsFeature()
        }
    }
}
