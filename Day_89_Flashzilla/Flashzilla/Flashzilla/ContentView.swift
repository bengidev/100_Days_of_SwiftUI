//
//  ContentView.swift
//  Flashzilla
//
//  Created by Bambang Tri Rahmat Doni on 01/10/23.
//

import SwiftUI

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = Double(total - position)
        return self.offset(x: 0, y: offset * 10)
    }
}

struct ContentView: View {
    /// Coloring views as we swipe
    ///
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    
    /// Counting down with a Timer
    ///
    @Environment(\.scenePhase) var scenePhase
    @State private var isActive = true
    
    /// Coloring views as we swipe
    ///
    @State private var cards = [Card](repeating: Card.example, count: 10)

    /// Counting down with a Timer
    ///
    @State private var timeRemaining = 100
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()

            VStack {
                Text("Timer: \(timeRemaining)")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 20)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
                
                ZStack {
                    ForEach(0 ..< cards.count, id: \.self) { index in
                        CardView(card: cards[index]) {
                            withAnimation {
                                removeCard(at: index)
                            }
                        }
                        .stacked(at: index, in: cards.count)
                    }
                    
                    if cards.isEmpty {
                        Button("Start Again", action: resetCards)
                            .padding()
                            .background(.white)
                            .foregroundColor(.black)
                            .clipShape(Capsule())
                    }
                }
                .allowsHitTesting(timeRemaining > 0)
            }
            
            if differentiateWithoutColor {
                VStack {
                    Spacer()
                    
                    HStack {
                        Image(systemName: "xmark.circle")
                            .background(.black.opacity(0.7))
                            .clipShape(Circle())
                        
                        Spacer()
                        
                        Image(systemName: "checkmark.circle")
                            .background(.black.opacity(0.7))
                            .clipShape(Circle())
                    }
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding()
                }
            }
        }
        .onReceive(timer) { _ in
            guard isActive else { return }
            
            if timeRemaining > 0 {
                timeRemaining -= 1
            }
        }
        .onChange(of: scenePhase) { newPhase in
            if newPhase == .active {
                if !cards.isEmpty {
                    isActive = true
                }
            } else {
                isActive = false
            }
        }
    }

    private func removeCard(at index: Int) {
        cards.remove(at: index)
        
        if cards.isEmpty {
            isActive = false
        }
    }
    
    /// Ending the app with allowsHitTesting()
    ///
    private func resetCards() -> Void {
        cards = [Card](repeating: Card.example, count: 10)
        timeRemaining = 100
        isActive = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
