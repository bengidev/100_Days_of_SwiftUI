//
//  Expenses.swift
//  iExpense
//
//  Created by Bambang Tri Rahmat Doni on 18/09/23.
//

import Foundation

/// Building a list we can delete from
/// 
class Expenses: ObservableObject {
    /// Making changes permanent with UserDefaults
    ///
    @Published var items = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    /// Making changes permanent with UserDefaults
    ///
    init() {
        let decoder = JSONDecoder()
        
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? decoder.decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}
