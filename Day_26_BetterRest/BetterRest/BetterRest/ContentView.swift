//
//  ContentView.swift
//  BetterRest
//
//  Created by Bambang Tri Rahmat Doni on 17/09/23.
//

import SwiftUI

struct ContentView: View {
    /// Entering numbers with Stepper
    ///
    @State private var sleepAmount = 8.0

    /// Selecting dates and times with DatePicker
    ///
    @State private var wakeUp = Date.now

    var body: some View {
        /// Entering numbers with Stepper
        ///
        VStack {
            Stepper("\(sleepAmount.formatted()) hours",
                    value: $sleepAmount,
                    in: 4 ... 12,
                    step: 0.25)
        }
        .padding()

        /// Selecting dates and times with DatePicker
        ///
        VStack {
            DatePicker("Please enter a date",
                       selection: $wakeUp,
                       in: Date.now...)
                .labelsHidden()
        }
        .padding()
        
        /// Working with dates
        ///
        VStack {
            Text(Date.now.formatted(date: .long, time: .shortened))
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
