//
//  EditCards.swift
//  Flashzilla
//
//  Created by Bambang Tri Rahmat Doni on 01/10/23.
//

import SwiftUI

struct EditCards: View {
    /// Adding and deleting cards
    ///
    @Environment(\.dismiss) var dismiss
    
    @State private var cards = [Card]()
    @State private var newPrompt = ""
    @State private var newAnswer = ""
    
    init() {}
    
    var body: some View {
        NavigationView {
            List {
                Section("Add New Card") {
                    TextField("Prompt", text: $newPrompt)
                    TextField("Answer", text: $newAnswer)
                    Button("Add Card", action: addCard)
                }
                
                Section {
                    ForEach(0..<cards.count, id: \.self) { index in
                        VStack(alignment: .leading) {
                            Text(cards[index].prompt)
                                .font(.headline)
                            Text(cards[index].answer)
                                .foregroundColor(.secondary)
                        }
                    }
                    .onDelete(perform: removeCards)
                }
            }
            .navigationTitle("Edit Cards")
            .toolbar { Button("Done", action: onDone) }
            .listStyle(.grouped)
            .onAppear(perform: loadData)
        }
    }
    
    private func onDone() -> Void {
        dismiss()
    }
    
    private func addCard() -> Void {
        let trimmedPrompt = newPrompt.trimmingCharacters(in: .whitespaces)
        let trimmedAnswer = newAnswer.trimmingCharacters(in: .whitespaces)
        guard !trimmedPrompt.isEmpty && !trimmedAnswer.isEmpty else { return }
        
        let card = Card(prompt: trimmedPrompt, answer: trimmedAnswer)
        cards.insert(card, at: 0)
        saveData()
    }
    
    private func removeCards(at offsets: IndexSet) -> Void {
        cards.remove(atOffsets: offsets)
        saveData()
    }
    
    private func saveData() -> Void {
        if let data = try? JSONEncoder().encode(cards) {
            UserDefaults.standard.set(data, forKey: "Cards")
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

struct EditCards_Previews: PreviewProvider {
    static var previews: some View {
        EditCards()
    }
}
