//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Bambang Tri Rahmat Doni on 16/09/23.
//

/// Views and modifiers: Introduction
/// See the details inside Hacking With Swift / Twitter.
///

/// Why does SwiftUI use structs for views?
/// See the details inside Hacking With Swift / Twitter.
///

/// What is behind the main SwiftUI view?
/// See the details inside Hacking With Swift / Twitter.
///

/// Why does SwiftUI use “some View” for its view type?
/// See the details inside Hacking With Swift / Twitter.
///

import SwiftUI

/// View composition
///
struct CapsuleText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .background(.blue)
            .clipShape(Capsule())
    }
}

/// Custom modifiers
///
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            
            
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(.black)
                .clipShape(RoundedRectangle(cornerRadius: 5))
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

/// Custom containers
///
struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    @ViewBuilder let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0...rows, id: \.self) { row in
                HStack {
                    ForEach(0...columns, id: \.self) {column in
                        content(row, column)
                    }
                }
            }
        }
    }
}

struct ContentView: View {
    /// Conditional modifiers
    ///
    @State private var useRedText = false
    
    /// Views as properties
    ///
//    let motto1 = Text("Draco dormiens")
//    let motto2 = Text("Nunquam titillandus")
    
    var motto1: some View {
        Text("Draco dormiens")
    }
    
    var motto2: some View {
        Text("Nunquam titillandus")
    }
    
//    var spells: some View {
//        VStack {
//            Text("Lumos")
//            Text("Obliviate")
//        }
//    }
    
//    var spells: some View {
//        Group {
//            Text("Lumos")
//            Text("Obliviate")
//        }
//    }
    
    @ViewBuilder var spells: some View {
        Group {
            Text("Lumos")
            Text("Obliviate")
        }
    }

    var body: some View {
        /// Why modifier order matters
        ///
//        Button("Hello, world!") {
//            print(type(of: self.body))
//        }
//        .background(.red)
//        .frame(width: 200, height: 200)

//        Button("Hello, world!") {
//            print(type(of: self.body))
//        }
//        .frame(width: 200, height: 200)
//        .background(.red)

//        Text("Hello, world!")
//            .padding()
//            .background(.red)
//            .padding()
//            .background(.blue)
//            .padding()
//            .background(.green)
//            .padding()
//            .background(.yellow)

        /// Conditional modifiers
        ///
//        Button("Hello World") {
//            // Flip the Boolean between true and false
//            useRedText.toggle()
//        }
//        .foregroundColor(useRedText ? .red : .blue)

//        if useRedText {
//            Button("Hello World") {
//                useRedText.toggle()
//            }
//            .foregroundColor(.red)
//        } else {
//            Button("Hello World") {
//                useRedText.toggle()
//            }
//            .foregroundColor(.blue)
//        }
        
        /// Environment modifiers
        ///
//        VStack {
//            Text("Gryffindor")
//                .font(.largeTitle)
//            Text("Hufflepuff")
//            Text("Ravenclaw")
//            Text("Slytherin")
//        }
//        .font(.title)
        
        /// Views as properties
        ///
//        VStack {
//            spells
//        }
        
        /// View composition
        ///
//        VStack(spacing: 10) {
//            Text("First")
//                .font(.largeTitle)
//                .padding()
//                .foregroundColor(.white)
//                .background(.blue)
//                .clipShape(Capsule())
//
//            CapsuleText(text: "Second")
//                .foregroundColor(.yellow)
//
//            CapsuleText(text: "Third")
//                .foregroundColor(.black)
//        }
        
        /// Custom modifiers
        ///
//        Text("Hello World")
//            .titleStyle()
        
//        Color.blue
//            .frame(width: 300, height: 200)
//            .watermarked(with: "Hacking With Swift")
        
        /// Custom containers
        ///
        GridStack(rows: 2, columns: 2) { row, column in
            Image(systemName: "\(row * 3 + column).circle")
            Text("R \(row), C\(column)")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
