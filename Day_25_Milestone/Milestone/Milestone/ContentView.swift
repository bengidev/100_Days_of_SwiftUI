//
//  ContentView.swift
//  Milestone
//
//  Created by Bambang Tri Rahmat Doni on 16/09/23.
//

/// Structs vs classes
/// See the details inside Hacking With Swift / Twitter.
///

import SwiftUI

struct ContentView: View {
    /// Working with bindings
    ///
    @State private var selection = 0

    @State private var agreedToTerms = false
    @State private var agreedToPrivacyPolicy = false
    @State private var agreedToEmails = false

    /// Working with ForEach
    ///
    private let agents = ["Cyril", "Lana", "Pam", "Sterling"]

    var body: some View {
        /// Working with bindings
        ///
        let binding = Binding<Int>(
            get: { selection },
            set: { selection = $0 }
        )

        let agreedToAll = Binding<Bool>(
            get: {
                agreedToTerms &&
                    agreedToPrivacyPolicy &&
                    agreedToEmails
            }, set: {
                agreedToTerms = $0
                agreedToPrivacyPolicy = $0
                agreedToEmails = $0
            }
        )

        /// Working with ForEach
        ///
//        VStack {
//            ForEach(agents, id: \.self) {
//                Text($0)
//            }
//        }
//        .padding()

        /// Working with bindings
        ///
//        VStack {
//            Picker("Select a number", selection: binding) {
//                ForEach(0 ..< 3) {
//                    Text("Item \($0)")
//                }
//            }
//            .pickerStyle(.segmented)
//        }
//        .padding()

        VStack {
            Toggle("Agree to terms", isOn: $agreedToTerms)
            Toggle("Agree to privacy policy", isOn: $agreedToPrivacyPolicy)
            Toggle("Agree to receive shipping mails", isOn: $agreedToEmails)
            Toggle("Agree to all", isOn: agreedToAll)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
