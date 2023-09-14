//
//  ContentView.swift
//  WeSplit
//
//  Created by Bambang Tri Rahmat Doni on 14/09/23.
//

import SwiftUI

struct ContentView: View {
    /// Reading text from the user with TextField
    ///
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool

    let tipPercentages = [10, 15, 20, 25, 0]

    /// Calculating the total per person
    ///
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountperPerson = grandTotal / peopleCount
        
        return amountperPerson
    }
    
    var body: some View {
        /// Reading text from the user with TextField
        ///
        /// Creating pickers in a form
        ///
        NavigationView {
            Form {
                Section {
                    TextField("Amount",
                              value: $checkAmount,
                              format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
                    /// Hiding the keyboard
                    ///
                    .focused($amountIsFocused)
                    
                    /// Creating pickers in a form
                    ///
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                /// Adding a segmented control for tip percentages
                ///
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                /// Calculating the total per person
                ///
                Section {
                    Text(totalPerPerson,
                         format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                } header: {
                    Text("Total per person")
                }
            }
            /// Creating pickers in a form
            ///
            .navigationTitle("WeSplit")
            /// Hiding the keyboard
            ///
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
