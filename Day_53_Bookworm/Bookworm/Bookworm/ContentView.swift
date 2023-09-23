//
//  ContentView.swift
//  Bookworm
//
//  Created by Bambang Tri Rahmat Doni on 23/09/23.
//

import SwiftUI

/// Creating a custom component with @Binding
///
struct PushButton: View {
    let title: String
//    @State var isOn: Bool
    @Binding var isOn: Bool

    private let onColors = [Color.red, Color.yellow]
    private let offColors = [Color(white: 0.6), Color(white: 0.4)]

    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(LinearGradient(colors: isOn ? onColors : offColors,
                                   startPoint: .top,
                                   endPoint: .bottom))
        .foregroundColor(.white)
        .clipShape(Capsule())
        .shadow(radius: isOn ? 0 : 5)
    }
}

struct ContentView: View {
    /// Creating a custom component with @Binding
    ///
    @State private var rememberMe = false

    /// Accepting multi-line text input with TextEditor
    ///
    @AppStorage("notes") private var notes = ""

    /// How to combine Core Data and SwiftUI
    ///
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    @Environment(\.managedObjectContext) var moc
    
    
    var body: some View {
        /// Creating a custom component with @Binding
        ///
//        VStack {
//            PushButton(title: "Remember Me", isOn: $rememberMe)
//            Text(rememberMe ? "On" : "Off")
//        }
//        .padding()

        /// Accepting multi-line text input with TextEditor
        ///
//        NavigationView {
//            VStack {
//                TextEditor(text: $notes)
//            }
//            .padding()
//            .navigationTitle("Notes")
//        }

        /// How to combine Core Data and SwiftUI
        ///
        VStack {
            List(students) { student in
                Text(student.name ?? "Unknown")
            }
            
            Button("Add Student") {
                let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]
                
                let chosenFirstName = firstNames.randomElement() ?? "Anonymous"
                let chosenLastName = lastNames.randomElement() ?? "Anonymous"
                
                let student = Student(context: moc)
                student.id = UUID()
                student.name = "\(chosenFirstName) \(chosenLastName)"
                
                try? moc.save()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
