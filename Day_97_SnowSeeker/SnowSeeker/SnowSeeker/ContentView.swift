//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Bambang Tri Rahmat Doni on 03/10/23.
//

import SwiftUI

struct ContentView: View {
    /// Searching for data in a List
    ///
    @State private var searchText = ""
    
    /// Building a primary list of items
    ///
    private let resorts: [Resort] = Bundle.main.decode("resorts.json")
    
    var body: some View {
        NavigationView {
            List(filteredResorts) { resort in
                NavigationLink {
                    ResortView(resort: resort)
                } label: {
                    Image(resort.country)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 25)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .overlay {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.black, lineWidth: 1)
                        }
                    
                    VStack(alignment: .leading) {
                        Text(resort.name)
                            .font(.headline)
                        Text("\(resort.runs) runs")
                            .foregroundColor(.secondary)
                    }
                }

            }
            .navigationTitle("Resorts")
            .searchable(text: $searchText, placement: .automatic, prompt: "Search for a resort")
            
            /// Making NavigationView work in landscape
            ///
            WelcomeView()
        }
    }
    
    /// Searching for data in a List
    ///
    var filteredResorts: [Resort] {
        if !searchText.isEmpty {
            return resorts.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        } else {
            return resorts
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
