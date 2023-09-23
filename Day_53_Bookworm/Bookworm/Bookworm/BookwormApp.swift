//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Bambang Tri Rahmat Doni on 23/09/23.
//

import SwiftUI

@main
struct BookwormApp: App {
    /// How to combine Core Data and SwiftUI
    ///
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
