//
//  DataController.swift
//  Bookworm
//
//  Created by Bambang Tri Rahmat Doni on 23/09/23.
//

import CoreData
import Foundation

/// How to combine Core Data and SwiftUI
///
class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Bookworm")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
