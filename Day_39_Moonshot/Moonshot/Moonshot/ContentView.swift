//
//  ContentView.swift
//  Moonshot
//
//  Created by Bambang Tri Rahmat Doni on 19/09/23.
//

import SwiftUI

/// How ScrollView lets us work with scrolling data
///
struct CustomText: View {
    let text: String
    
    init(_ text: String) {
        print("Creating a new CustomText: \(text)")
        self.text = text
    }
    
    var body: some View {
        Text(text)
    }
}

/// Working with hierarchical Codable data
///
struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}

struct ContentView: View {
    /// How to lay out views in a scrolling grid
    ///
//    let layout = [
//        GridItem(.fixed(80)),
//        GridItem(.fixed(80)),
//        GridItem(.fixed(80)),
//    ]
    
    let layout = [
        GridItem(.adaptive(minimum: 80, maximum: 120))
    ]
    
    var body: some View {
        /// Resizing images to fit the screen using GeometryReader
        ///
//        GeometryReader { geo in
//            VStack {
//                Image("apple_logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: geo.size.width * 0.8, height: 300)
//                    .frame(width: geo.size.width, height: geo.size.height)
//            }
//        }
        
        /// How ScrollView lets us work with scrolling data
        ///
//        ScrollView {
//            LazyVStack(spacing: 10) {
//                ForEach(0..<100) {
//                    CustomText("Item \($0)")
//                        .font(.title)
//                }
//            }
//            .frame(maxWidth: .infinity)
//        }
        
//        ScrollView(.horizontal) {
//            LazyHStack(spacing: 10) {
//                ForEach(0..<100) {
//                    CustomText("Item \($0)")
//                        .font(.title)
//                }
//            }
//            .frame(maxWidth: .infinity)
//        }
        
        /// Pushing new views onto the stack using NavigationLink
        ///
//        NavigationView {
//            List(1..<100) { row in
//                NavigationLink {
//                    Text("Detail \(row)")
//                } label: {
//                    Text("Row \(row)")
//                }
//            }
//            .navigationTitle("SwiftUI")
//        }
        
        /// Working with hierarchical Codable data
        ///
//        VStack {
//            Button("Decode JSON") {
//                let input = """
//                            {
//                                "name": "Taylor Swift
//                                "address": {
//                                    "street": "555, Taylor Swift Avenue"
//                                    "city": "Nashville"
//                                }
//                            }
//                            """
//                let data = Data(input.utf8)
//                let decoder = JSONDecoder()
//                if let user = try? decoder.decode(User.self, from: data) {
//                    print(user.address.street)
//                }
//            }
//        }
        
        /// How to lay out views in a scrolling grid
        ///
//        ScrollView {
//            LazyVGrid(columns: layout) {
//                ForEach(1..<100) {
//                    Text("Item \($0)")
//                }
//            }
//        }
        
        ScrollView(.horizontal) {
            LazyHGrid(rows: layout) {
                ForEach(1..<100) {
                    Text("Item \($0)")
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
