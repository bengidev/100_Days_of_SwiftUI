//
//  MeView.swift
//  HotProspects
//
//  Created by Bambang Tri Rahmat Doni on 30/09/23.
//

import SwiftUI

struct MeView: View {
    /// Building our tab bar
    ///
    var body: some View {
        NavigationView {
            Text("Hello, World!")
                .navigationTitle("Me")
        }
    }
}

struct MeView_Previews: PreviewProvider {
    static var previews: some View {
        MeView()
    }
}
