//
//  DataController.swift
//  CoreDataProject
//
//  Created by Bambang Tri Rahmat Doni on 23/09/23.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "CoreDataProject")
    
    /// Ensuring Core Data objects are unique using constraints
    ///
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
            
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
}
