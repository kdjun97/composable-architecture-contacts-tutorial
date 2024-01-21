//
//  ContactNavigationTutorialApp.swift
//  ContactNavigationTutorial
//
//  Created by 김동준 on 1/21/24
//

import SwiftUI
import ComposableArchitecture

@main
struct ContactNavigationTutorialApp: App {
    static let store = Store(initialState: ContactsFeature.State()) {
        ContactsFeature()
    }
    var body: some Scene {
        WindowGroup {
            ContactsView(store: ContactNavigationTutorialApp.store)
        }
    }
}
