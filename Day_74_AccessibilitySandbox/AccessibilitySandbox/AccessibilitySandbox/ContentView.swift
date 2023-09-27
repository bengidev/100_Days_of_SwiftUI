//
//  ContentView.swift
//  AccessibilitySandbox
//
//  Created by Bambang Tri Rahmat Doni on 27/09/23.
//

import SwiftUI

struct ContentView: View {
    /// Identifying views with useful labels
    ///
    @State private var selectedPicture = Int.random(in: 0...3)
    
    /// Reading the value of controls
    ///
    @State private var value = 10
    
    private let pictures = [
        "ales-krivec-15949",
        "galina-n-189483",
        "kevin-horstmann-141705",
        "nicolas-tissot-335096",
    ]
    
    private let labels = [
        "Tulips",
        "Frozen tree buds",
        "Sunflowers",
        "Fireworks",
    ]
    
    var body: some View {
        /// Identifying views with useful labels
        ///
        VStack {
            Image(pictures[selectedPicture])
                .resizable()
                .scaledToFit()
                .onTapGesture {
                    withAnimation { selectedPicture = Int.random(in: 0...3) }
                }
                .accessibilityLabel(labels[selectedPicture])
                .accessibilityRemoveTraits(.isImage)
                .accessibilityAddTraits(.isButton)
        }
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.all, 5)
        
//        /// Hiding and grouping accessibility data
//        ///
//        VStack {
//            Image(decorative: "ales-krivec-15949")
//                .accessibilityHidden(true)
//        }
//
//        VStack {
//            Text("Your score is")
//            Text("1000")
//                .font(.title)
//        }
//        .accessibilityElement(children: .combine)
//
//        VStack {
//            Text("Your score is")
//            Text("1000")
//                .font(.title)
//        }
//        .accessibilityElement(children: .ignore)
//        .accessibilityLabel("Your score is 1000")
//
//        /// Reading the value of controls
//        ///
//        VStack(spacing: 10) {
//            Text("Value: \(value)")
//
//            Button("Increment") { value += 1 }
//
//            Button("Decrement") { value -= 1 }
//        }
//        .accessibilityElement()
//        .accessibilityLabel("Value")
//        .accessibilityValue(String(value))
//        .accessibilityAdjustableAction { direction in
//            switch direction {
//            case .increment:
//                value += 1
//            case .decrement:
//                value -= 1
//            default:
//                print("Not handled.")
//            }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
