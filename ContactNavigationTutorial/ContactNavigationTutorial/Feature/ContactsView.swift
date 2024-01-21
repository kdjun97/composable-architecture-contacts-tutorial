//
//  ContactsView.swift
//  ContactNavigationTutorial
//
//  Created by 김동준 on 1/21/24
//

import Foundation
import SwiftUI
import ComposableArchitecture

struct ContactsView: View {
    let store: StoreOf<ContactsFeature>
    
    var body: some View {
        NavigationStack {
            WithViewStore(self.store, observe: { $0 }) { viewStore in
                List {
                    ForEach(viewStore.state.contacts) { contact in
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
                action: \.addContact
            )
        ) { addContactStore in
            NavigationStack {
                AddContactsView(store: addContactStore)
            }
        }
    }
}
