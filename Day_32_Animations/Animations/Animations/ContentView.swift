//
//  ContentView.swift
//  Animations
//
//  Created by Bambang Tri Rahmat Doni on 17/09/23.
//

import SwiftUI

struct ContentView: View {
    /// Creating implicit animations
    ///
    @State private var animationAmount = 1.0

    var body: some View {
        /// Creating implicit animations
        ///
//        VStack {
//            Button("Tap Me") {
//                animationAmount += 1
//            }
//            .padding(60)
//            .background(.red)
//            .foregroundColor(.white)
//            .clipShape(Circle())
//            .scaleEffect(animationAmount)
//            .animation(.default, value: animationAmount)
//            .blur(radius: (animationAmount - 1) * 3)
//        }
//        .padding()

        /// Customizing animations in SwiftUI
        ///
//        VStack {
//            Button("Tap Me") {
//                animationAmount += 1
//            }
//            .padding(60)
//            .background(.red)
//            .foregroundColor(.white)
//            .clipShape(Circle())
//            .scaleEffect(animationAmount)
        ////            .animation(.easeOut, value: animationAmount)
        ////            .animation(.interpolatingSpring(stiffness: 50, damping: 1), value: animationAmount)
        ////            .animation(.easeInOut(duration: 2), value: animationAmount)
        ////            .animation(.easeInOut(duration: 2)
        ////                .delay(1), value: animationAmount)
//            .animation(.easeInOut(duration: 1)
//                .repeatForever(autoreverses: true), value: animationAmount)
//        }
//        .padding()

//        VStack {
//            Button("Tap Me") {}
//                .padding(60)
//                .background(.red)
//                .foregroundColor(.white)
//                .clipShape(Circle())
//                .overlay(Circle()
//                    .stroke(.red)
//                    .scaleEffect(animationAmount)
//                    .opacity(2 - animationAmount)
//                    .animation(.easeInOut(duration: 1)
//                        .repeatForever(autoreverses: false), value: animationAmount)
//                )
//        }
//        .padding()
//        .onAppear {
//            animationAmount = 2
//        }

        /// Animating bindings
        ///
//        VStack {
        ////            Stepper("Scale amount",
        ////                    value: $animationAmount.animation(),
        ////                    in: 1 ... 10)
//
//            Stepper("Scale amount",
//                    value: $animationAmount.animation(
//                        .easeInOut(duration: 1)
//                            .repeatCount(3, autoreverses: true)),
//                    in: 1 ... 10)
//
//            Spacer()
//
//            Button("Tap Me") {
//                animationAmount += 1
//            }
//            .padding(40)
//            .background(.red)
//            .foregroundColor(.white)
//            .clipShape(Circle())
//            .scaleEffect(animationAmount)
//        }
//        .padding()

        /// Creating explicit animations
        ///
        VStack {
//            Button("Tap Me") {
//                withAnimation {
//                    animationAmount += 360
//                }
//            }
            Button("Tap Me") {
                withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                    animationAmount += 360
                }
            }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
