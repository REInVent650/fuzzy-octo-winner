//
//  SaWApp.swift
//  SaW
//
//  Created by Startegy In Motion on 3/04/23.
//

import SwiftUI

@main
struct SaWApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
