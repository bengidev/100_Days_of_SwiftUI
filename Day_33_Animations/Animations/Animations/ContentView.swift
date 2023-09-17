//
//  ContentView.swift
//  Animations
//
//  Created by Bambang Tri Rahmat Doni on 17/09/23.
//

import SwiftUI

/// Building custom transitions using ViewModifier
///
struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint

    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(active: CornerRotateModifier(amount: -90, anchor: .topLeading),
                  identity: CornerRotateModifier(amount: 0, anchor: .topLeading))
    }
}

struct ContentView: View {
    /// Controlling the animation stack
    ///
    @State private var enabled = false

    /// Animating gestures
    ///
    let letters = Array("Hello, SwiftUI")
    @State private var dragAmount = CGSize.zero

    /// Showing and hiding views with transitions
    ///
    @State private var isShowingRed = false

    var body: some View {
        /// Controlling the animation stack
        ///
//        VStack {
//            Button("Tap Me") {
//                enabled.toggle()
//            }
//            .frame(width: 200, height: 200)
//            .background(enabled ? .blue : .red)
//            .animation(.default, value: enabled)
//            .foregroundColor(.white)
//            .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
//            .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: enabled)
//        }
//        .padding()

        /// Animating gestures
        ///
//        VStack {
//            LinearGradient(colors: [.yellow, .red],
//                           startPoint: .topLeading,
//                           endPoint: .bottomTrailing)
//            .frame(width: 300, height: 200)
//            .clipShape(RoundedRectangle(cornerRadius: 10))
//            .offset(dragAmount)
        ////            .animation(.spring(), value: dragAmount)
//            .gesture(DragGesture()
//                .onChanged { dragAmount = $0.translation }
//                .onEnded { _ in
//                    withAnimation(.spring()) {
//                        dragAmount = .zero
//                    }
//                }
//            )
//        }
//        .padding()

//        HStack(spacing: 0) {
//            ForEach(0..<letters.count, id: \.self) { index in
//                Text(String(letters[index]))
//                    .padding(5)
//                    .font(.title)
//                    .background(enabled ? .blue : .red)
//                    .offset(dragAmount)
//                    .animation(.default.delay(Double(index) / 20), value: dragAmount)
//            }
//        }
//        .padding()
//        .gesture(DragGesture()
//            .onChanged { dragAmount = $0.translation }
//            .onEnded { _ in
//                dragAmount = .zero
//                enabled.toggle()
//            }
//        )

        /// Showing and hiding views with transitions
        ///
//        VStack {
//            Button("Tap Me") {
//                withAnimation {
//                    isShowingRed.toggle()
//                }
//            }
//
//            if isShowingRed {
//                Rectangle()
//                    .fill(.red)
//                    .frame(width: 200, height: 200)
////                    .transition(.scale)
//                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
//            }
//        }

        /// Building custom transitions using ViewModifier
        ///
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 200)
            
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }
        .onTapGesture {
            withAnimation {
                isShowingRed.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
