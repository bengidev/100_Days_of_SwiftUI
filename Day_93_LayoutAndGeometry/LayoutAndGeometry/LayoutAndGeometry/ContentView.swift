//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Bambang Tri Rahmat Doni on 02/10/23.
//

import SwiftUI

/// Understanding frames and coordinates inside GeometryReader
///
struct OuterView: View {
    var body: some View {
        VStack {
            Text("Top")
            InnerView()
                .background(.green)
            Text("Bottom")
        }
    }
}

struct InnerView: View {
    var body: some View {
        HStack {
            Text("Left")
            GeometryReader { geometry in
                Text("Center")
                    .background(.blue)
                    .onTapGesture {
                        print("Global Center: \(geometry.frame(in: .global).midX) x \(geometry.frame(in: .global).midY)")
                        print("Custom Center: \(geometry.frame(in: .named("Custom")).midX) x \(geometry.frame(in: .named("Custom")).midY)")
                        print("Local Center: \(geometry.frame(in: .local).midX) x \(geometry.frame(in: .local).midY)")
                    }
            }
            .background(.orange)
            Text("Right")
        }
    }
}

struct ContentView: View {
    /// ScrollView effects using GeometryReader
    ///
    private let colors = [
        Color.red,
        Color.green,
        Color.blue,
        Color.orange,
        Color.pink,
        Color.purple,
        Color.yellow,
    ]

    var body: some View {
        /// Absolute positioning for SwiftUI views
//        VStack {
//            Image(systemName:
//                "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//        }
//        .padding()
//        .position(x: 100, y: 100)
//        .background(.red.opacity(0.75))
        
//        VStack {
//            Image(systemName:
//                "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//        }
//        .padding()
//        .offset(x: 100, y: 100)
//        .background(.red.opacity(0.75))

        /// Understanding frames and coordinates inside GeometryReader
        ///
//        OuterView()
//            .background(.red.opacity(0.75))
//            .coordinateSpace(name: "Custom")
        
        /// ScrollView effects using GeometryReader
        ///
//        GeometryReader { fullView in
//            ScrollView {
//                ForEach(0 ..< 50) { index in
//                    GeometryReader { geometry in
//                        Text("Row #\(index)")
//                            .font(.title)
//                            .frame(maxWidth: .infinity)
//                            .background(colors[index % 7])
//                            .rotation3DEffect(.degrees(geometry.frame(in: .global).minY - fullView.size.height / 2) / 5,
//                                              axis: (x: 0, y: 1, z: 0))
//                    }
//                    .frame(height: 40)
//                }
//            }
//        }

        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(0 ..< 20) { num in
                    GeometryReader { geo in
                        Text("Number \(num)")
                            .font(.largeTitle)
                            .padding()
                            .background(.red)
                            .rotation3DEffect(.degrees(-geo.frame(in: .global).minX / 8),
                                              axis: (x: 0, y: 1, z: 0))
                            .frame(width: 200, height: 200)
                    }
                    .frame(width: 200, height: 200)
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
