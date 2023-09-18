//
//  AddView.swift
//  iExpense
//
//  Created by Bambang Tri Rahmat Doni on 18/09/23.
//

import SwiftUI

struct AddView: View {
    /// Sharing an observed object with a new view
    ///
    @ObservedObject var expenses: Expenses
    
    /// Final polish
    ///
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0

    private let types = ["Business", "Personal"]

    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)

                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }

                TextField("Amount",
                          value: $amount,
                          format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            /// Making changes permanent with UserDefaults
            /// 
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    
                    /// Final polish
                    ///
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
