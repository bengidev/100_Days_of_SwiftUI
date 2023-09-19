//
//  Mission.swift
//  Moonshot
//
//  Created by Bambang Tri Rahmat Doni on 19/09/23.
//

import Foundation

/// Using generics to load any kind of Codable data
///

/// Formatting our mission view
///
struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
