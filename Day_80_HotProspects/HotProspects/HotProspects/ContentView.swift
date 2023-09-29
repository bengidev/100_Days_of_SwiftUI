//
//  ContentView.swift
//  HotProspects
//
//  Created by Bambang Tri Rahmat Doni on 29/09/23.
//

import SwiftUI

/// Manually publishing ObservableObject changes
///
@MainActor class DelayedUpdater: ObservableObject {
//    @Published var value = 0

    var value = 0 {
        willSet {
            objectWillChange.send()
        }
    }

    init() {
        for i in 1 ... 10 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i), execute: .init(block: {
                self.value += 1
            }))
        }
    }
}

struct ContentView: View {
    /// Manually publishing ObservableObject changes
    ///
    @StateObject private var updater = DelayedUpdater()

    /// Understanding Swift’s Result type
    ///
    @State private var output = ""

    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//
//            Text("Value is: \(updater.value)")
//        }
//        .padding()

        /// Understanding Swift’s Result type
        ///
//        VStack {
//            Text(output)
//        }
//        .padding()
//        .task {
//            await fetchReadings()
//        }
        
        /// Controlling image interpolation in SwiftUI
        ///
        VStack {
            Image("example")
                .interpolation(.none)
                .resizable()
                .scaledToFit()
                .frame(maxHeight: .infinity)
                .background(.black)
                .ignoresSafeArea()
        }
    }

    /// Understanding Swift’s Result type
    ///
    private func fetchReadings() async {
//        do {
//            let url = URL(string: "https://hws.dev/readings.json")!
//            let (data, _) = try await URLSession.shared.data(from: url)
//            let readings = try JSONDecoder().decode([Double].self, from: data)
//            output = "Found \(readings.count) readings"
//        } catch {
//            print("Download error: \(error.localizedDescription)")
//        }

        let fetchReadings = Task {
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)
            return "Found \(readings.count) readings"
        }
        
        let result = await fetchReadings.result
        
//        do {
//            output = try result.get()
//        } catch {
//            output = "Error: \(error.localizedDescription)"
//        }
        
        switch result {
        case .success(let success):
            output = success
        case .failure(let failure):
            output = "Error: \(failure.localizedDescription)"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
