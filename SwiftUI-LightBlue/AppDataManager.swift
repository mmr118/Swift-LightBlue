//
//  Persistence.swift
//  SwiftUI-LightBlue
//
//  Created by Rondon Monica on 03.11.22.
//  Copyright © 2022 Pluto-y. All rights reserved.
//

import CoreData

class AppDataManager {

    static let shared = AppDataManager()

    let container: NSPersistentContainer

    var mainContext: NSManagedObjectContext { container.viewContext }

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "SwiftUI_LightBlue")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true

        loadDefaultDataIfNeeded()
    }

    public func loadDefaultDataIfNeeded(forced: Bool = false) { }

    func saveContext() {
        Self.save(mainContext)
    }

}

extension AppDataManager {

    static func save(_ context: NSManagedObjectContext) {
        if context.hasChanges {
            context.performAndWait {
                do {
                    try context.save()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }

}
