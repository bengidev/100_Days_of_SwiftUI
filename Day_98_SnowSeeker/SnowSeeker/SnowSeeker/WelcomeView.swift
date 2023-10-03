//
//  WelcomeView.swift
//  SnowSeeker
//
//  Created by Bambang Tri Rahmat Doni on 04/10/23.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Welcome to SnowSeeker!")
                .font(.largeTitle)
            
            Text("Please select a resort from the left-hand menu, \n" +
            "swipe from the left edge to show it.")
            .foregroundColor(.secondary)
        }
        .padding(.all, 5)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
