//
//  AddContactsView.swift
//  ContactNavigationTutorial
//
//  Created by 김동준 on 1/21/24
//

import Foundation
import SwiftUI
import ComposableArchitecture

struct AddContactsView: View {
    let store: StoreOf<AddContactsFeature>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            Form {
                TextField(
                    "Name",
                    text: viewStore.binding(
                        get: \.contact.name,
                        send: { .setName($0) }
                    )
                )
                Button("Save") {
                    viewStore.send(.saveButtonTapped)
                }
            }
            .toolbar {
                ToolbarItem {
                    Button("Cancel") {
                        viewStore.send(.cancelButtonTapped)
                    }
                }
            }
        }
    }
}
