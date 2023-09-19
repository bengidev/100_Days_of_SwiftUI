//
//  Astronaut.swift
//  Moonshot
//
//  Created by Bambang Tri Rahmat Doni on 19/09/23.
//

import Foundation

/// Loading a specific kind of Codable data
/// 
struct Astronaut: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
}
