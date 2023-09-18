//
//  ContentView.swift
//  iExpense
//
//  Created by Bambang Tri Rahmat Doni on 18/09/23.
//

import SwiftUI

struct ContentView: View {
    /// Building a list we can delete from
    ///
    @StateObject var expenses = Expenses()
    
    /// Sharing an observed object with a new view
    ///
    @State private var showingAddExpense = false
    
    var body: some View {
        /// Building a list we can delete from
        ///
        NavigationView {
            List {
                /// Final polish
                ///
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                            Text(item.type)
                        }
                        
                        Spacer()
                        Text(item.amount, format: .currency(code: "USD"))
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    /// Building a list we can delete from
    ///
    private func removeItems(at offsets: IndexSet) -> Void {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
