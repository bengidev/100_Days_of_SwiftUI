//
//  ContentView-ViewModel.swift
//  Bucketlist
//
//  Created by Bambang Tri Rahmat Doni on 27/09/23.
//

import Foundation
import LocalAuthentication
import MapKit

/// Introducing MVVM into your SwiftUI project
///
extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        @Published var isUnlocked = false

        @Published var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0),
                                                      span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
        @Published private(set) var locations = [Location]()
        @Published var selectedPlace: Location?

        private let savePath = FileManager.documentsDirectory.appending(path: "SavedPlaces")

        init() {
            do {
                let data = try Data(contentsOf: savePath)
                locations = try JSONDecoder().decode([Location].self, from: data)
            } catch {
                print("Failed from converting SavedPlaces data into Location.")
                locations = []
            }
        }

        /// Locking our UI behind Face ID
        /// 
        func authenticate() {
            let context = LAContext()
            var error: NSError?

            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                let reason = "Please authenticate yourself to unlock your places."

                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, _ in
//                    if success {
//                        Task {
//                            await MainActor.run {
//                                self.isUnlocked = true
//                            }
//                        }
//                    } else {
//                        print("Error when processing authentication: \(String(describing: error?.localizedDescription))")
//                    }

                    if success {
                        Task { @MainActor in
                            self.isUnlocked = true
                        }
                    } else {
                        print("Error when processing authentication: \(String(describing: error?.localizedDescription))")
                    }
                }
            }
        }

        func addLocation() {
            let newLocation = Location(id: UUID(),
                                       name: "New Location",
                                       description: "None",
                                       latitude: mapRegion.center.latitude,
                                       longitude: mapRegion.center.longitude)
            locations.append(newLocation)
            saveIntoDirectory()
        }

        func updateLocation(_ location: Location) {
            guard let selectedPlace = selectedPlace else { return }

            if let index = locations.firstIndex(of: selectedPlace) {
                locations[index] = location
                saveIntoDirectory()
            }
        }

        func updateSelectedPlace(_ newPlace: Location) {
            selectedPlace = newPlace
        }

        private func saveIntoDirectory() {
            do {
                let data = try JSONEncoder().encode(locations)
                try data.write(to: savePath, options: [.atomic, .completeFileProtection])
            } catch {
                print("Failed to save the Data into Directory.")
            }
        }
    }
}
