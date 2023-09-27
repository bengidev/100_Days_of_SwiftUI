//
//  ContentView.swift
//  Bucketlist
//
//  Created by Bambang Tri Rahmat Doni on 27/09/23.
//

import MapKit
import SwiftUI

struct ContentView: View {
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
    @State private var locations = [Location]()
    @State private var selectedPlace: Location?
    
    var body: some View {
        VStack {
            ZStack {
                Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
                    MapAnnotation(coordinate: location.coordinate, content: {
                        VStack {
                            Image(systemName: "mappin.and.ellipse")
                                .resizable()
                                .frame(width: 44, height: 44)

                            Text(location.name)
                                .fixedSize()
                        }
                        .onTapGesture {
                            withAnimation { selectedPlace = location }
                        }
                    })
                }
                .ignoresSafeArea()

                Circle().fill(.red)
                    .opacity(0.5)
                    .frame(width: 32, height: 32)

                VStack {
                    Spacer()

                    HStack {
                        Spacer()

                        Button {
                            let newLocation = Location(id: UUID(), name: "New Location", description: "None", latitude: mapRegion.center.latitude, longitude: mapRegion.center.longitude)
                            locations.append(newLocation)
                        } label: {
                            Image(systemName: "plus")
                                .symbolVariant(.none)
                        }
                        .padding()
                        .background(.black.opacity(0.75))
                        .foregroundColor(.white)
                        .font(.title2)
                        .clipShape(Circle())
                        .padding([.bottom, .trailing], 20)
                    }
                }
            }
            .cornerRadius(10)
            .shadow(radius: 5)
            .sheet(item: $selectedPlace) { place in
                EditView(location: place) { newLocation in
                    if let index = locations.firstIndex(of: place) {
                        withAnimation { locations[index] = newLocation }
                    }
                }
            }
        }
        .padding(.all, 5)
        .background(.secondary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
