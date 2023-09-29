//
//  ContentView.swift
//  HotProspects
//
//  Created by Bambang Tri Rahmat Doni on 29/09/23.
//

import SwiftUI

/// Reading custom values from the environment with @EnvironmentObject
///
@MainActor class User: ObservableObject {
    @Published var name = "Taylor Swift"
}

/// Reading custom values from the environment with @EnvironmentObject
///
struct EditView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        VStack {
            TextField("Name", text: $user.name)
        }
    }
}

/// Reading custom values from the environment with @EnvironmentObject
///
struct DisplayView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        Text(user.name)
    }
}

struct ContentView: View {
    /// Reading custom values from the environment with @EnvironmentObject
    ///
    @StateObject var user = User()
    
    /// Creating tabs with TabView and tabItem()
    ///
    @State private var selectedTab = "One"
    
    var body: some View {
//        VStack(spacing: 10) {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//                .padding(.bottom, 20)
//
//            EditView()
//            DisplayView()
//        }
//        .padding()
//        .environmentObject(user)
        
        /// Creating tabs with TabView and tabItem()
        ///
        VStack {
            TabView(selection: $selectedTab) {
                Text("Tab 1")
                    .onTapGesture {
                        selectedTab = "Two"
                    }
                    .tabItem {
                        Label("One", systemImage: "star")
                    }
                    .tag("One")
                
                Text("Tab 2")
                    .onTapGesture {
                        selectedTab = "Two"
                    }
                    .tabItem {
                        Label("Two", systemImage: "circle")
                    }
                    .tag("Two")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
