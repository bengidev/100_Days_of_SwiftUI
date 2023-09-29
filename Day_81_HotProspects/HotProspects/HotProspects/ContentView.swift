//
//  ContentView.swift
//  HotProspects
//
//  Created by Bambang Tri Rahmat Doni on 29/09/23.
//

import SamplePackage
import SwiftUI
import UserNotifications

struct ContentView: View {
    /// Creating context menus
    ///
    @State private var backgroundColor = Color.red

    /// Adding Swift package dependencies in Xcode
    ///
    private let possibleNumbers = Array(1...60)
    
    var body: some View {
        /// Creating context menus
        ///
//        VStack {
//            Text("Hello, world!")
//                .padding()
//                .background(backgroundColor)
//
//            Text("Change Color")
//                .padding()
//                .contextMenu {
//                    Button {
//                        withAnimation { backgroundColor = .red }
//                    } label: {
//                        Label("Red", systemImage: "1.circle")
//                    }
//
//                    Button {
//                        withAnimation { backgroundColor = .green }
//                    } label: {
//                        Label("Green", systemImage: "2.circle")
//                    }
//
//                    Button {
//                        withAnimation { backgroundColor = .blue }
//                    } label: {
//                        Label("Blue", systemImage: "3.circle")
//                    }
//                }
//        }
//        .padding()

        /// Adding custom row swipe actions to a List
        ///
//        VStack {
//            List {
//                Text("Hello, world!")
//                    .swipeActions {
//                        Button(role: .destructive) {
//                            print("Hi!")
//                        } label: {
//                            Label("Delete", systemImage: "minus.circle")
//                        }
//                    }
//                    .swipeActions(edge: .leading) {
//                        Button(role: .destructive) {
//                            print("Pinned!")
//                        } label: {
//                            Label("Pin", systemImage: "pin")
//                        }
//                        .tint(.orange)
//                    }
//            }
//        }

        /// Scheduling local notifications
        ///
//        VStack {
//            Button {
//                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
//                    if success {
//                        print("All Set!")
//                    } else if let error = error {
//                        print(error.localizedDescription)
//                    }
//                }
//            } label: {
//                Label("Request Permission", systemImage: "bell.badge")
//            }
//            .padding()
//
//            Button {
//                let content = UNMutableNotificationContent()
//                content.title = "Feed the cat"
//                content.subtitle = "It looks hungry"
//                content.sound = UNNotificationSound.default
//
//                // Show this notification five seconds from now
//                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
//
//                // Choose a random identifier
//                let request = UNNotificationRequest(identifier: UUID().uuidString,
//                                                    content: content,
//                                                    trigger: trigger)
//
//                // Add our notification request
//                UNUserNotificationCenter.current().add(request) { error in
//                    if let error = error {
//                        print("Error adding notification request: \(error.localizedDescription)")
//                    }
//                }
//            } label: {
//                Label("Scheduling Notification", systemImage: "timer")
//            }
//            .padding()
//        }
//        .padding()
        
        /// Adding Swift package dependencies in Xcode
        ///
        VStack {
            Text(results)
        }
        .padding()
    }
    
    var results: String {
        let selected = possibleNumbers.random(7).sorted()
        let strings = selected.map { String($0) }
        return strings.joined(separator: ", ")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
