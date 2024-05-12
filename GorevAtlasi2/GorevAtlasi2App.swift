//
//  GorevAtlasi2App.swift
//  GorevAtlasi2
//
//  Created by Zehra Öner on 2.04.2024.
//

import SwiftUI

@main
struct GorevAtlasi2App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
         ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

