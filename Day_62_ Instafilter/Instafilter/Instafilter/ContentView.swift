//
//  ContentView.swift
//  Instafilter
//
//  Created by Bambang Tri Rahmat Doni on 24/09/23.
//

import SwiftUI

struct ContentView: View {
    /// Responding to state changes using onChange()
    ///
    @State private var blurAmount: CGFloat = 0.0 {
        didSet {
            print("New value is: \(blurAmount)")
        }
    }
    
    /// Showing multiple options with confirmationDialog()
    ///
    @State private var showingDialog = false
    @State private var backgroundColor = Color.white

    var body: some View {
        /// Responding to state changes using onChange()
        ///
//        VStack {
//            Group {
//                Image(systemName: "globe")
//                    .imageScale(.large)
//                    .foregroundColor(.accentColor)
//                Text("Hello, world!")
//            }
//            .blur(radius: blurAmount)
//
//            Slider(value: $blurAmount, in: 0 ... 20)
////                .onChange(of: blurAmount) { newValue in
////                    print("New value is: \(newValue)")
////                }
//
//            Button("Random Blur") {
//                blurAmount = Double.random(in: 0 ... 20)
//            }
//        }
//        .padding()
//        .onChange(of: blurAmount) { newValue in
//            print("New value is: \(newValue)")
//        }
        
        /// Showing multiple options with confirmationDialog()
        ///
        VStack {
            VStack(alignment: .center) {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
            }
            .frame(width: 200, height: 200)
            .background(backgroundColor)
            .onTapGesture {
                showingDialog = true
            }
        }
        .padding()
//        .confirmationDialog("Change Background", isPresented: $showingDialog) {
//            Button("Red") { backgroundColor = .red }
//            Button("Green") { backgroundColor = .green }
//            Button("Blue") { backgroundColor = .blue }
//            Button("Cancel", role: .cancel) { }
//        } message: {
//            Text("Select a new color")
//        }
        .confirmationDialog("Change Background", isPresented: $showingDialog) {
            Button("Red") { backgroundColor = .red }
            Button("Green") { backgroundColor = .green }
            Button("Blue") { backgroundColor = .blue }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Select a new color")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
