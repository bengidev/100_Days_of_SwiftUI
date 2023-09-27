//
//  ContentView.swift
//  WordScramble
//
//  Created by Bambang Tri Rahmat Doni on 17/09/23.
//

import SwiftUI

struct ContentView: View {
    /// Adding to a list of words
    ///
    @State private var useWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""

    /// Validating words with UITextChecker
    ///
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false

    var body: some View {
        /// Adding to a list of words
        ///
        NavigationView {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                }

                Section {
                    ForEach(useWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                        .accessibilityElement(children: .ignore)
                        .accessibilityLabel(word)
                        .accessibilityHint("\(word.count) letters")
                    }
                }
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWord)
            .onAppear(perform: startGame)
            .alert(errorTitle, isPresented: $showingError) {
                Button("OK", role: .cancel) {}

            } message: {
                Text(errorMessage)
            }
        }
    }

    private func addNewWord() {
        // Lowercase and trim the word, to make sure we don't want
        // add duplicate words with case differences
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)

        // Exit if the remaining String is empty
        guard answer.count > 0 else { return }

        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            newWord = ""
            return
        }

        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from \(rootWord)")
            newWord = ""
            return
        }

        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            newWord = ""
            return
        }

        withAnimation {
            useWords.insert(answer, at: 0)
            newWord = ""
        }
    }

    /// Running code when our app launches
    ///
    private func startGame() {
        // 1. Find the URL for start.txt in our app bundle
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            // 2. Load start.txt into a String
            if let startWords = try? String(contentsOf: startWordsURL) {
                // 3. Split the String up into an array of Strings,
                // splitting one line breaks
                let allWords = startWords.components(separatedBy: "\n")

                // 4. Pick one random word, or use "silkworm"
                // as a sensible default
                rootWord = allWords.randomElement() ?? "silkworm"

                // If we are here everything has worked, so we can exit
                return
            }
        }

        // If we are *here* then there was a problem -
        // trigger a crash and report that error
        fatalError("Could not load start.txt from bundle!")
    }

    /// Validating words with UITextChecker
    ///
    private func isOriginal(word: String) -> Bool {
        return !useWords.contains(word)
    }

    private func isPossible(word: String) -> Bool {
        var tempWord = rootWord

        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }

        return true
    }

    private func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word,
                                                            range: range,
                                                            startingAt: 0,
                                                            wrap: false,
                                                            language: "en")
        return misspelledRange.location == NSNotFound
    }

    private func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
