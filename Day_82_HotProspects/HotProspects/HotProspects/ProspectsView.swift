//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Bambang Tri Rahmat Doni on 30/09/23.
//

import SwiftUI

struct ProspectsView: View {
    /// Building our tab bar
    ///
    enum FilterType {
        case none, contacted, uncontacted
    }

    let filter: FilterType

    /// Sharing data across tabs using @EnvironmentObject
    ///
    @EnvironmentObject var prospects: Prospects

    var body: some View {
        /// Dynamically filtering a SwiftUI List
        ///
        NavigationView {
            List {
                ForEach(filteredProspects) { prospect in
                    VStack(alignment: .leading) {
                        Text(prospect.name)
                            .font(.headline)
                        Text(prospect.emailAddress)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle(title)
            .toolbar {
                Button {
                    let prospect = Prospect()
                    prospect.name = "Paul Hudson"
                    prospect.emailAddress = "paul@hackingwithswift.com"
                    
                    let prospect1 = Prospect()
                    prospect1.name = "Paul Hudsons"
                    prospect1.emailAddress = "paul@hackingwithswift.coms"
                    prospect1.isContacted = true
                    
                    let prospect2 = Prospect()
                    prospect2.name = "Paul Hudsonsx"
                    prospect2.emailAddress = "paul@hackingwithswift.comsx"
                    prospect2.isContacted = true
                    
                    prospects.people.append(prospect)
                    prospects.people.append(prospect1)
                    prospects.people.append(prospect2)
                } label: {
                    Label("Scan", systemImage: "qrcode.viewfinder")
                }
            }
        }
    }

    var title: String {
        switch filter {
        case .none:
            return "Everyone"
        case .contacted:
            return "Contacted People"
        case .uncontacted:
            return "Uncontacted People"
        }
    }

    /// Dynamically filtering a SwiftUI List
    ///
    var filteredProspects: [Prospect] {
        switch filter {
        case .none:
            return prospects.people
        case .contacted:
            return prospects.people.filter { $0.isContacted }
        case .uncontacted:
            return prospects.people.filter { !$0.isContacted }
        }
    }
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(filter: .none)
            .environmentObject(Prospects())
    }
}
