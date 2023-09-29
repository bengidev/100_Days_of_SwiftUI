//
//  Prospect.swift
//  HotProspects
//
//  Created by Bambang Tri Rahmat Doni on 30/09/23.
//

import SwiftUI

/// Sharing data across tabs using @EnvironmentObject
///
class Prospect: Identifiable, Codable {
    var id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    var isContacted = false
}

@MainActor class Prospects: ObservableObject {
    @Published var people: [Prospect]
    
    init() {
        self.people = []
    }
}
