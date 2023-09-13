//
//  ContentView.swift
//  WeSplit
//
//  Created by Bambang Tri Rahmat Doni on 14/09/23.
//

import SwiftUI

struct ContentView: View {
    /// Modifying program state
    ///
    @State private var tapCount = 0
    
    /// Binding state to user interface controls
    ///
    @State private var name = ""
    
    /// Creating views in a loop
    ///
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudents = "Harry"
    

    var body: some View {
        /// Creating a form
        ///
//        Form {
//            Group {
//                Text("Hello, world!")
//                Text("Hello, world!")
//                Text("Hello, world!")
//                Text("Hello, world!")
//                Text("Hello, world!")
//                Text("Hello, world!")
//            }
//
//            Group {
//                Text("Hello, world!")
//                Text("Hello, world!")
//                Text("Hello, world!")
//                Text("Hello, world!")
//                Text("Hello, world!")
//            }
//        }
        
//        Form {
//            Section {
//                Text("Hello, world!")
//            }
//
//            Section {
//                Text("Hello, world!")
//                Text("Hello, world!")
//            }
//        }

        /// Adding a navigation bar
        ///
//        NavigationView {
//            Form {
//                Section {
//                    Text("Hello, world!")
//                }
//                Section {
//                    Text("Hello, world!")
//                    Text("Hello, world!")
//                }
//            }
//            .navigationTitle("SwiftUI")
//            .navigationBarTitleDisplayMode(.inline)
//        }

        /// Modifying program state
        ///
//        Button("Tap Count: \(tapCount)") {
//            self.tapCount += 1
//        }
        
        /// Binding state to user interface controls
        ///
//        Form {
//            TextField("Enter your name", text: $name)
//            Text("Your name is \(name)")
//        }
        
        /// Creating views in a loop
        ///
        NavigationView {
            Form {
                Picker("Select your student", selection: $selectedStudents) {
                    ForEach(students, id: \.self) {
                        Text($0)
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
