//
//  ContentView.swift
//  WordScramble
//
//  Created by Bambang Tri Rahmat Doni on 17/09/23.
//

import SwiftUI

struct ContentView: View {
    /// Introducing List, your best friend
    ///
    private let people = ["Finn", "Leia", "Luke", "Rey"]

    var body: some View {
        /// Introducing List, your best friend
        ///
//        VStack {
//            List {
//                Text("Hello World")
//                Text("Hello World")
//                Text("Hello World")
//            }
//        }

//        VStack {
//            List {
//                ForEach(0..<5) {
//                    Text("Dynamic row \($0)")
//                }
//            }
//        }

//        VStack {
//            List {
//                Text("Static row 1")
//                Text("Static row 2")
//
//                ForEach(0..<5) {
//                    Text("Dynamic row \($0)")
//                }
//
//                Text("Static row 3")
//                Text("Static row 4")
//            }
//        }

//        VStack {
//            List {
//                Section("Section 1") {
//                    Text("Static row 1")
//                    Text("Static row 2")
//                }
//
//                Section("Section 2") {
//                    ForEach(0..<5) {
//                        Text("Dynamic row \($0)")
//                    }
//                }
//
//                Section("Section 3") {
//                    Text("Static row 3")
//                    Text("Static row 4")
//                }
//            }.listStyle(.sidebar)
//        }

//        VStack {
//            List(0..<5) {
//                Text("Dynamic row \($0)")
//            }
//        }

        VStack {
            List {
                Text("Static Row")

                ForEach(people, id: \.self) {
                    Text($0)
                }

                Text("Static Row")
            }
        }
    }

    /// Loading resources from your app bundle
    ///
    private func loadBundle() {
        if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
            // We found the file in our bundle

            if let fileContents = try? String(contentsOf: fileURL) {
                // We loaded the file into a String
                print(fileContents)
            }
        }
    }

    /// Working with strings
    ///
    private func loadStrings() {
//        let input = "a b c"
//        let letters = input.components(separatedBy: " ")

//        let input = """
//                    a
//                    b
//                    c
//                    """
//        let letters = input.components(separatedBy: "\n")

        let input = "a b c"
        let letters = input.components(separatedBy: " ")
        let letter = letters.randomElement()
        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let word  = "swift"
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let missppelledRange = checker.rangeOfMisspelledWord(in: word,
                                                             range: range,
                                                             startingAt: 0,
                                                             wrap: false,
                                                             language: "en")
        let allGood = missppelledRange.location == NSNotFound
        print(allGood)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
