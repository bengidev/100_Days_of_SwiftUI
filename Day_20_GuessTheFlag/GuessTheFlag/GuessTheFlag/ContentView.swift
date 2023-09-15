//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Bambang Tri Rahmat Doni on 16/09/23.
//

import SwiftUI

struct ContentView: View {
    /// Showing alert messages
    ///
    @State private var showingAlert = false
    
    var body: some View {
        /// Using stacks to arrange views
        ///
//        VStack {
//            Spacer()
//            Text("First")
//            Text("Second")
//            Text("Third")
//            Spacer()
//            Spacer()
//        }

//        HStack {
//            Text("Hello world!")
//            Text("This is inside a HStack")
//        }

//        ZStack {
//            Text("Hello world!")
//            Text("This is inside a ZStack")
//        }

//        VStack {
//            VStack {
//                HStack {
//                   Text("1")
//                   Text("2")
//                   Text("3")
//                }
//            }
//
//            VStack {
//                HStack {
//                   Text("4")
//                   Text("5")
//                   Text("6")
//                }
//            }
//
//            VStack {
//                HStack {
//                   Text("7")
//                   Text("8")
//                   Text("9")
//                }
//            }
//        }

        /// Colors and frames
        ///
//        ZStack {
//            VStack(spacing: 0) {
//                Color.red
//                Color.blue
//            }
//
//            Text("Your content")
//                .foregroundStyle(.secondary)
//                .padding(50)
//                .background(.ultraThinMaterial)
//        }
//        .ignoresSafeArea()

        /// Gradients
        ///
//        LinearGradient(gradient: Gradient(colors: [.white, .black]),
//                       startPoint: .top,
//                       endPoint: .bottom)

//        LinearGradient(gradient: Gradient(stops: [
//            Gradient.Stop(color: .white, location: 0.45),
//            Gradient.Stop(color: .black, location: 0.55),
//        ]),
//        startPoint: .top,
//        endPoint: .bottom)

//        LinearGradient(gradient: Gradient(stops: [
//            .init(color: .white, location: 0.45),
//            .init(color: .black, location: 0.55),
//        ]),
//        startPoint: .top,
//        endPoint: .bottom)

//        RadialGradient(gradient: Gradient(colors: [.blue, .black]),
//                       center: .center,
//                       startRadius: 20,
//                       endRadius: 200)

//        AngularGradient(gradient: Gradient(colors: [
//            .red, .yellow, .green, .blue, .purple, .red,
//        ]),
//        center: .center)
        
        /// Buttons and images
        ///
//        Button("Delete selection", action: executeDelete)
        
//        Button("Delete selection", role: .destructive, action: executeDelete)
        
//        VStack {
//            Button("Button 1") { }
//                .buttonStyle(.bordered)
//            Button("Button 2", role: .destructive) { }
//                .buttonStyle(.bordered)
//            Button("Button 3") { }
//                .buttonStyle(.borderedProminent)
//            Button("Button 3") { }
//                .buttonStyle(.borderedProminent)
//                .tint(.mint)
//            Button("Button 4", role: .destructive) { }
//                .buttonStyle(.borderedProminent)
//        }
        
//        Button {
//            print("Button was tapped")
//        } label: {
//            Text("Tap me")
//                .padding()
//                .foregroundColor(.white)
//                .background(.red)
//        }
        
//        Button {
//            print("Button was tapped")
//        } label: {
//            Image(systemName: "pencil")
//        }
        
//        Button {
//            print("Button was tapped")
//        } label: {
//            Label("Edit", systemImage: "pencil")
//        }
        
        /// Showing alert messages
        ///
        Button("Show alert") {
            showingAlert = true
        }
        .alert("Important message", isPresented: $showingAlert) {
            Button("Delete", role: .destructive) { }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Please read this.")
        }
    }
    
    func executeDelete() -> Void {
        print("Now deleting...")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
