//
//  Card.swift
//  Flashzilla
//
//  Created by Bambang Tri Rahmat Doni on 01/10/23.
//

import Foundation

/// Designing a single card view
/// 
struct Card {
    let prompt: String
    let answer: String
    
    static let example = Card(prompt: "Who played the 13th Doctor in Doctor Who", answer: "Jodie Whittaker")
}
