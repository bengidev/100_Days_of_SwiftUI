//
//  ContentView.swift
//  iExpense
//
//  Created by Bambang Tri Rahmat Doni on 18/09/23.
//

import SwiftUI

/// Why @State only works with structs
///
//struct User {
//    var firstName = "Bilbo"
//    var lastName = "Baggins"
//}

//class User {
//    var firstName = "Bilbo"
//    var lastName = "Baggins"
//}

/// Sharing SwiftUI state with @StateObject
///
class User: ObservableObject {
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
}

/// Archiving Swift objects with Codable
///
struct NewUser: Codable {
    let firstName: String
    let lastName: String
}

struct ContentView: View {
    /// Why @State only works with structs
    ///
//    @State private var user = User()
    
    /// Sharing SwiftUI state with @StateObject
    ///
    @StateObject private var user = User()
    
    /// Showing and hiding views
    ///
    @State private var showingSheet = false
    
    /// Deleting items using onDelete()
    ///
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    /// Storing user settings with UserDefaults
    ///
//    @State private var tapCount = 0
//    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    
    @AppStorage("Tap") private var tapCount = 0
    
    /// Archiving Swift objects with Codable
    ///
    @State private var newUser = NewUser(firstName: "Taylor", lastName: "Swift")
    
    var body: some View {
//        VStack {
//            Text("Your name is: \(user.firstName) \(user.lastName)")
//
//            TextField("First Name", text: $user.firstName)
//            TextField("Last Name", text: $user.lastName)
//
//        }
//        .padding()
        
        /// Showing and hiding views
        ///
//        VStack {
//            Button("Show Sheet") {
//                showingSheet.toggle()
//            }
//        }
//        .padding()
//        .sheet(isPresented: $showingSheet) {
////            SecondView(name: "Anonymous")
//            SecondView()
//        }
        
        /// Deleting items using onDelete()
        ///
//        NavigationView {
//            VStack {
//                List {
//                    ForEach(numbers, id: \.self) {
//                        Text("Row \($0)")
//                    }
//                    .onDelete(perform: removeRows)
//                }
//
//                Button("Add Number") {
//                    numbers.append(currentNumber)
//                    currentNumber += 1
//                }
//            }
//            .navigationTitle("onDelete()")
//            .toolbar {
//                EditButton()
//            }
//        }
        
        /// Storing user settings with UserDefaults
        ///
//        Button("Tap Count: \(tapCount)") {
//            tapCount += 1
//            UserDefaults.standard.set(self.tapCount, forKey: "Tap")
//        }
        
//        Button("Tap Count: \(tapCount)") {
//            tapCount += 1
//        }
        
        /// Archiving Swift objects with Codable
        ///
        Button("Save NewUser") {
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(newUser) {
                UserDefaults.standard.set(data, forKey: "NewUserData")
            }
        }
    }
    
    /// Deleting items using onDelete()
    ///
    private func removeRows(at offsets: IndexSet) -> Void {
        numbers.remove(atOffsets: offsets)
    }
}

/// Showing and hiding views
///
struct SecondView: View {
//    let name: String
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
//        Text("Hello, \(name)")
        
        Button("Dismiss") {
            dismiss()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
