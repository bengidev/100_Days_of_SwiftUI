//
//  ContentView.swift
//  Bucketlist
//
//  Created by Bambang Tri Rahmat Doni on 27/09/23.
//

import LocalAuthentication
import MapKit
import SwiftUI

/// Integrating MapKit with SwiftUI
///
struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct ContentView: View {
    /// Integrating MapKit with SwiftUI
    ///
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    private let locations = [
        Location(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
        Location(name: "Tower Of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076)),
    ]
    
    /// Using Touch ID and Face ID with SwiftUI
    ///
    @State private var isUnlocked = false

    var body: some View {
        /// Integrating MapKit with SwiftUI
        ///
//        VStack {
//            Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
//                MapMarker(coordinate: location.coordinate)
//            }
//            .cornerRadius(10)
//        }
//        .padding(.all, 5)

        /// Integrating MapKit with SwiftUI
        ///
//        NavigationView {
//            VStack {
//                Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
//                    MapAnnotation(coordinate: location.coordinate) {
//                        NavigationLink {
//                            Text(location.name)
//                        } label: {
//                            Circle()
//                                .stroke(.red, lineWidth: 3)
//                                .frame(width: 44, height: 44)
//                        }
//
//                    }
//                }
//                .cornerRadius(10)
//            }
//            .navigationTitle("London Explorer")
//            .padding(.all, 5)
//            .shadow(radius: 5)
//        }
        
        /// Using Touch ID and Face ID with SwiftUI
        ///
        VStack {
            isUnlocked ? Text("Unlocked") : Text("Locked")
        }
        .onAppear(perform: authenticate)
    }
    
    /// Using Touch ID and Face ID with SwiftUI
    ///
    private func authenticate() -> Void {
        let context = LAContext()
        var error: NSError?
        
        // Check whether biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // It's possible, so go ahead and use it
            // This permission reason is for Touch ID, whereas in Target Options is for Face ID
            let reason = "We need to unlock your data."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // Authentication has now completed
                if success {
                    // Authenticated successfully
                    withAnimation { isUnlocked = true }
                } else {
                    // There was a problem
                    print("Error while checking Biometrics: \(String(describing: error?.localizedDescription))")
                }
            }
        } else {
            // No biometrics
            print("You don't have Authentication Biometrics")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
