//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Bambang Tri Rahmat Doni on 03/10/23.
//

import SwiftUI

/// Using alert() and sheet() with optionals
///
struct User: Identifiable {
    let id = "Anonymous"
}

/// Using groups as transparent layout containers
///
struct UserView: View {
    var body: some View {
        Group {
            Text("Name: Anonymous")
            Text("Country: Australia")
            Text("Pets: Dragon")
        }
        .font(.title)
    }
}

struct ContentView: View {
    /// Using groups as transparent layout containers
    ///
    @Environment(\.horizontalSizeClass) var sizeClass

    /// Using alert() and sheet() with optionals
    ///
    @State private var selectedUser: User?
    @State private var isShowingUser = false

    /// Making a SwiftUI view searchable
    ///
    @State private var searchText = ""
    private let allNames = ["Subh", "Vina", "Melvin", "Stefanie"]

    var body: some View {
        /// Working with two side by side views in SwiftUI
        ///
//        NavigationView {
//            NavigationLink {
//                VStack {
//                    Image(systemName: "2.circle")
//                        .imageScale(.large)
//                        .foregroundColor(.accentColor)
//                    Text("New Secondary")
//                }
//                .padding()
//            } label: {
//                VStack {
//                    Image(systemName: "globe")
//                        .imageScale(.large)
//                        .foregroundColor(.accentColor)
//                    Text("Hello, world!")
//                }
//                .padding()
//            }
//            .navigationTitle("Primary")
//
//            VStack {
//                Image(systemName: "2.circle")
//                    .imageScale(.large)
//                    .foregroundColor(.accentColor)
//                Text("Secondary")
//            }
//            .padding()
//
//            VStack {
//                Image(systemName: "3.circle")
//                    .imageScale(.large)
//                    .foregroundColor(.accentColor)
//                Text("Tertiary")
//            }
//            .padding()
//        }

        /// Using alert() and sheet() with optionals
        ///
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//        }
//        .padding()
//        .onTapGesture {
//            selectedUser = User()
//            isShowingUser = true
//        }
        ////        .sheet(isPresented: $isShowingUser) {
        ////            Text(selectedUser?.id ?? "Unknown")
        ////        }
        ////        .sheet(item: $selectedUser) { user in
        ////            Text(user.id)
        ////        }
        ////        .alert("Welcome", isPresented: $isShowingUser) {
        ////            Button("OK") { }
        ////        }
        ////        .alert("Welcome", isPresented: $isShowingUser) { }
//        .alert("Welcome", isPresented: $isShowingUser, presenting: selectedUser) { user in
//            Button(user.id) { }
//        } message: { user in
//            Text(user.id)
//        }

        /// Using groups as transparent layout containers
        ///
//        if sizeClass == .compact {
//            VStack(content: UserView.init)
//        } else {
//            HStack(content: UserView.init)
//        }

        /// Making a SwiftUI view searchable
        ///
        NavigationView {
            List(filteredNames, id: \.self) { name in
                Text(name)
            }
            .searchable(text: $searchText, placement: .automatic, prompt: "Look for something")
            .navigationTitle("Searching")
        }
    }
    
    /// Making a SwiftUI view searchable
    ///
    private var filteredNames: [String] {
        if !searchText.isEmpty {
            return allNames.filter { $0.localizedCaseInsensitiveContains(searchText) }
        } else {
            return allNames
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
