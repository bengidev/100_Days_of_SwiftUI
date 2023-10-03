//
//  View-PhoneOnly.swift
//  SnowSeeker
//
//  Created by Bambang Tri Rahmat Doni on 04/10/23.
//

import SwiftUI

/// Making NavigationView work in landscape
///
extension View {
    @ViewBuilder func phoneOnlyStackNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            self.navigationViewStyle(.stack)
        } else {
            self
        }
    }
}
