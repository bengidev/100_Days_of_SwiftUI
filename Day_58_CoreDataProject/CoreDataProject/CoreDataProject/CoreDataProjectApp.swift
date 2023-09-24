//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Bambang Tri Rahmat Doni on 24/09/23.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    /// Filtering @FetchRequest using NSPredicate
    ///
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
