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

/// Fixing the bugs
///
struct ContentView: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityVoiceOverEnabled) var voiceOverEnabled
    @Environment(\.scenePhase) var scenePhase

    /// Adding and deleting cards
    ///
    @State private var isActive = false
    @State private var cards = [Card]()
    @State private var timeRemaining = 100
    @State private var showingEditScreen = false

    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        ZStack {
            Image(decorative: "background")
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
                        .allowsHitTesting(index == cards.count - 1)
                        .accessibilityHidden(index < cards.count - 1)
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

            VStack {
                HStack {
                    Spacer()

                    Button {
                        withAnimation { showingEditScreen = true }
                    } label: {
                        Image(systemName: "plus.circle")
                            .background(.black.opacity(0.7))
                            .clipShape(Circle())
                    }
                }

                Spacer()
            }
            .foregroundColor(.white)
            .font(.largeTitle)
            .padding()

            if differentiateWithoutColor || voiceOverEnabled {
                VStack {
                    Spacer()

                    HStack {
                        Button {
                            withAnimation { removeCard(at: cards.count - 1) }
                        } label: {
                            Image(systemName: "xmark.circle")
                                .background(.black.opacity(0.7))
                                .clipShape(Circle())
                        }
                        .accessibilityLabel("Wrong")
                        .accessibilityHint("Mark your answer as being incorrect.")

                        Spacer()

                        Button {
                            withAnimation { removeCard(at: cards.count - 1) }
                        } label: {
                            Image(systemName: "checkmark.circle")
                                .background(.black.opacity(0.7))
                                .clipShape(Circle())
                        }
                        .accessibilityLabel("Correct")
                        .accessibilityHint("Mark your answer as being correct.")
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
        .sheet(isPresented: $showingEditScreen, onDismiss: resetCards) {
            EditCards()
        }
        .onAppear(perform: resetCards)
     }

    private func removeCard(at index: Int) {
        guard index >= 0 else { return }

        cards.remove(at: index)

        if cards.isEmpty {
            isActive = false
        }
    }

    private func resetCards() {
        loadData()
        timeRemaining = 100
        
        if !cards.isEmpty {
            isActive = true
        }
    }
    
    private func loadData() -> Void {
        if let data = UserDefaults.standard.data(forKey: "Cards") {
            if let decoded = try? JSONDecoder().decode([Card].self, from: data) {
                cards = decoded
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
