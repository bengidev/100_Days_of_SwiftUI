//
//  ContentView.swift
//  Flashzilla
//
//  Created by Bambang Tri Rahmat Doni on 01/10/23.
//

import SwiftUI

func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
    if UIAccessibility.isReduceMotionEnabled {
        return try body()
    } else {
        return try withAnimation(animation, body)
    }
}

struct ContentView: View {
    /// Supporting specific accessibility needs with SwiftUI
    ///
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    @State private var scale = 1.0

    /// How to be notified when your SwiftUI app moves to the background
    ///
    @Environment(\.scenePhase) var scenePhase

    /// Triggering events repeatedly using a timer
    ///
    @State private var counter = 0

    private let timer = Timer.publish(every: 1, tolerance: 0.1, on: .main, in: .common).autoconnect()

    var body: some View {
        /// Triggering events repeatedly using a timer
        ///
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//        }
//        .padding()
//        .onReceive(timer) { time in
//            if counter == 5 {
//                timer.upstream.connect().cancel()
//            } else {
//
//                print("The time is now: \(time)")
//            }
//
//            counter += 1
//        }

        /// How to be notified when your SwiftUI app moves to the background
        ///
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//        }
//        .padding()
//        .onChange(of: scenePhase) { newPhase in
//            if newPhase == .active {
//                print("Active")
//            } else if newPhase == .inactive {
//                print("Inactive")
//            } else if newPhase == .background {
//                print("Background")
//            }
//        }

        /// Supporting specific accessibility needs with SwiftUI
        ///
//        HStack {
//            if differentiateWithoutColor {
//                Image(systemName: "checkmark.circle")
//            }
//
//            Text("Success")
//        }
//        .padding()
//        .background(differentiateWithoutColor ? .black : .green)
//        .foregroundColor(.white)
//        .clipShape(Capsule())

//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//        }
//        .scaleEffect(scale)
//        .onTapGesture {
//            reduceMotion ? scale *= 1.5 : withAnimation { scale *= 1.5 }
//        }
        
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//        }
//        .scaleEffect(scale)
//        .onTapGesture {
//            withOptionalAnimation { scale *= 1.5 }
//        }
        
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
        .background(reduceTransparency ? .black : .black.opacity(0.5))
        .foregroundColor(.white)
        .clipShape(Capsule())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
