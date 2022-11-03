//
//  SwiftUI_LightBlueApp.swift
//  SwiftUI-LightBlue
//
//  Created by Rondon Monica on 03.11.22.
//  Copyright © 2022 Pluto-y. All rights reserved.
//

import SwiftUI

@main
struct SwiftUI_LightBlueApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
