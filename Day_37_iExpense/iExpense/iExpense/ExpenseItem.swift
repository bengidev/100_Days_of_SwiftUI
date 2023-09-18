//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Bambang Tri Rahmat Doni on 18/09/23.
//

import Foundation

/// Building a list we can delete from
///

/// Working with Identifiable items in SwiftUI
///

/// Making changes permanent with UserDefaults
///
struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    
    let name: String
    let type: String
    let amount: Double    
}
