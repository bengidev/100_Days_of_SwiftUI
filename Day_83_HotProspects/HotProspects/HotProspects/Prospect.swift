//
//  Prospect.swift
//  HotProspects
//
//  Created by Bambang Tri Rahmat Doni on 30/09/23.
//

import SwiftUI

class Prospect: Identifiable, Codable {
    /// Adding options with swipe actions
    ///
    var id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    fileprivate(set) var isContacted = false
}

@MainActor class Prospects: ObservableObject {
    @Published var people: [Prospect]
    
    init() {
        self.people = []
    }
    
    func toggle(_ prospect: Prospect) -> Void {
        objectWillChange.send()
        prospect.isContacted.toggle()
    }
}
