//
//  Result.swift
//  Bucketlist
//
//  Created by Bambang Tri Rahmat Doni on 27/09/23.
//

import Foundation

/// Sorting Wikipedia results
/// 
struct Result: Codable {
    let query: Query
}

struct Query: Codable {
    let pages: [Int: Page]
}

struct Page: Codable, Comparable, Equatable {
    let pageid: Int
    let title: String
    let terms: Terms?
    
    var description: String {
        terms?.descriptions.first ?? "No further information."
    }
    
    static func <(lhs: Page, rhs: Page) -> Bool {
        lhs.title < rhs.title
    }
    
    static func ==(lhs: Page, rhs: Page) -> Bool {
        lhs.pageid < rhs.pageid
    }
}

struct Terms: Codable {
    let descriptions: [String]
    
    enum CodingKeys: CodingKey {
        case description
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.descriptions, forKey: .description)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.descriptions = try container.decode([String].self, forKey: .description)
    }
}
