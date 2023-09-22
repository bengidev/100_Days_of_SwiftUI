//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Bambang Tri Rahmat Doni on 23/09/23.
//

import SwiftUI

/// Adding Codable conformance for @Published properties
///
class User: ObservableObject, Codable {
    @Published var name = "Hacking With Swift"

    enum CodingKeys: CodingKey {
        case name
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}

/// Sending and receiving Codable data with URLSession and SwiftUI
///
struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct ContentView: View {
    /// Sending and receiving Codable data with URLSession and SwiftUI
    ///
    @State private var results = [Result]()

    /// Validating and disabling forms
    ///
    @State private var username = ""
    @State private var email = ""

    var body: some View {
        /// Sending and receiving Codable data with URLSession and SwiftUI
        ///
//        VStack {
//            List(results, id: \.trackId) { item in
//                LazyVStack(alignment: .leading) {
//                    Text(item.trackName)
//                        .font(.headline)
//
//                    Text(item.collectionName)
//                }
//            }
//        }.task {
//            await loadData()
//        }

        /// Loading an image from a remote server
        ///
//        VStack {
//            AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { image in
//                image
//                    .resizable()
//                    .scaledToFit()
//            } placeholder: {
//                ProgressView("Loading your image.")
//            }
//            .frame(width: 200, height: 200)
//        }
//
//        VStack {
//            AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { phase in
//                if let image = phase.image {
//                    image
//                        .resizable()
//                        .scaledToFit()
//                } else if phase.error != nil {
//                    Text("There was an error loading the image")
//                } else {
//                    ProgressView("Loading your image.")
//                }
//            }
//            .frame(width: 200, height: 200)
//        }

        /// Validating and disabling forms
        ///
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }

            Section {
                Button("Create Account") {
                    print("Creating your account...")
                }
            }
            .disabled(isFormDisabled)
        }
    }

    /// Sending and receiving Codable data with URLSession and SwiftUI
    ///
    private func loadData() async {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.results
            }
        } catch {
            print("Invalid Data")
        }
    }

    /// Validating and disabling forms
    ///
    private var isFormDisabled: Bool {
        username.count < 5 || email.count < 5
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
