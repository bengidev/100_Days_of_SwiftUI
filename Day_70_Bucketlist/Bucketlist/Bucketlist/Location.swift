//
//  Location.swift
//  Bucketlist
//
//  Created by Bambang Tri Rahmat Doni on 27/09/23.
//

import Foundation
import MapKit

/// Improving our map annotations
///
struct Location: Identifiable, Codable, Equatable {
    var id: UUID
    var name: String
    var description: String
    let latitude: Double
    let longitude: Double

    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }

    static let example = Location(id: UUID(),
                                  name: "Buckingham Palace",
                                  description: "Where Queen Elizabeth lives with her dorgis",
                                  latitude: 51.501,
                                  longitude: -0.141)

    /// Selecting and editing map annotations
    ///
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
