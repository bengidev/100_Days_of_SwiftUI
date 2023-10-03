//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Bambang Tri Rahmat Doni on 04/10/23.
//

import Foundation

/// Letting the user mark favorites
///
@MainActor class Favorites: ObservableObject {
    // The actual resorts the user has favorited
    private var resorts: Set<String>
    
    // The key we're using to read/write in UserDefaults
    private let saveKey = "Favorites"
    
    init() {
        let decoder = JSONDecoder()
        
        if let savedItems = UserDefaults.standard.data(forKey: saveKey) {
            if let decodedItems = try? decoder.decode(Set<String>.self, from: savedItems) {
                resorts = decodedItems
                return
            }
        }
        
        resorts = []
    }
    
    // Returns true if our set contains this resort
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }
    
    // Adds the resort to our set, updates all views, and saves the change
    func add(_ resort: Resort) -> Void {
        objectWillChange.send()
        resorts.insert(resort.id)
        saveData()
    }
    
    // Removes the resort from our set, updates all views, and saves the change
    func remove(_ resort: Resort) -> Void {
        objectWillChange.send()
        resorts.remove(resort.id)
        saveData()
    }
    
    private func saveData() -> Void {
        let encoder = JSONEncoder()
        
        if let encoded = try? encoder.encode(resorts) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
}
