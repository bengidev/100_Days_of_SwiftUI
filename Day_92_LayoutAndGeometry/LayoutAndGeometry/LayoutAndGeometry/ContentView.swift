//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Bambang Tri Rahmat Doni on 01/10/23.
//

import SwiftUI

/// How to create a custom alignment guide
///
extension VerticalAlignment {
    struct MidAccountAndName: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.top]
        }
    }
    
    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}

struct ContentView: View {
    var body: some View {
        /// How layout works in SwiftUI
        ///
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//        }
//        .padding(20)
//        .background(.red.opacity(0.5))
//        .cornerRadius(10)

        /// Alignment and alignment guides
        ///
//        VStack(alignment: .leading) {
//            ForEach(0 ..< 10) { position in
//                Text("Number \(position)")
//                    .alignmentGuide(.leading) { _ in CGFloat(position) * -10 }
//            }
//        }
//        .background(.red.opacity(0.75))
//        .frame(width: 400, height: 400)
//        .background(.blue)
        
        /// How to create a custom alignment guide
        ///
        HStack(alignment: .midAccountAndName) {
            VStack {
                Text("@example")
                    .alignmentGuide(.midAccountAndName) { dimensions in dimensions[VerticalAlignment.center] }
                Image("apple_logo")
                    .resizable()
                    .frame(width: 64, height: 64)
            }
            
            VStack {
                Text("Full Name: ")
                Text("Anonymous")
                    .alignmentGuide(.midAccountAndName) { dimensions in dimensions[VerticalAlignment.center] }
                    .font(.largeTitle)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
