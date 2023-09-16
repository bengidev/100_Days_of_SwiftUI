//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Bambang Tri Rahmat Doni on 16/09/23.
//

import SwiftUI

struct ContentView: View {
    /// Stacking up buttons
    ///

    /// Showing the player’s score with an alert
    ///
    @State private var countries = [
        "Estonia",
        "France",
        "Germany",
        "Ireland",
        "Italy",
        "Nigeria",
        "Poland",
        "Russia",
        "Spain",
        "UK",
        "US",
    ]
    @State private var correctAnswer = Int.random(in: 1 ... 2)
    @State private var showingScore = false
    @State private var scoreTitle = ""

    var body: some View {
        /// Stacking up buttons
        ///
        ZStack {
            /// Styling our flags
            ///

            /// Upgrading our design
            ///
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top,
            startRadius: 200,
            endRadius: 800)

            VStack {
                Spacer()
                
                Text("Guess The Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)

                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag off")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))

                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }

                    /// Showing the player’s score with an alert
                    ///

                    /// Styling our flags
                    ///
                    ForEach(0 ..< 3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: ???")
                    .foregroundColor(.white)
                    .font(.title.weight(.bold))
                
                Spacer()
            }
            .padding()
        }
        /// Showing the player’s score with an alert
        ///
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is ???")
        }
    }

    /// Showing the player’s score with an alert
    ///
    private func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }

        showingScore = true
    }

    private func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0 ... 2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
