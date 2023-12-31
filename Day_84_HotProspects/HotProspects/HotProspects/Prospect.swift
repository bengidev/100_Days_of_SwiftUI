//
//  Prospect.swift
//  HotProspects
//
//  Created by Bambang Tri Rahmat Doni on 30/09/23.
//

import SwiftUI

class Prospect: Identifiable, Codable {
    var id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    fileprivate(set) var isContacted = false
}


/// Saving and loading data with UserDefaults
///
@MainActor class Prospects: ObservableObject {
    @Published private(set) var people: [Prospect]
    
    private let saveKey = "SavedData"
    
    init() {
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
                people = decoded
                return
            }
        }
        
        people = []
    }
    
    func toggle(_ prospect: Prospect) -> Void {
        objectWillChange.send()
        prospect.isContacted.toggle()
        save()
    }
    
    func add(_ prospect: Prospect) -> Void {
        people.append(prospect)
        save()
    }
    
    private func save() -> Void {
        if let encoded = try?JSONEncoder().encode(people) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
}
