//
//  ContentView.swift
//  Bucketlist
//
//  Created by Bambang Tri Rahmat Doni on 27/09/23.
//

import MapKit
import SwiftUI

struct ContentView: View {
    /// Introducing MVVM into your SwiftUI project
    /// 
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            ZStack {
                if viewModel.isUnlocked {
                    Map(coordinateRegion: $viewModel.mapRegion, annotationItems: viewModel.locations) { location in
                        MapAnnotation(coordinate: location.coordinate, content: {
                            VStack {
                                Image(systemName: "mappin.and.ellipse")
                                    .resizable()
                                    .frame(width: 44, height: 44)

                                Text(location.name)
                                    .fixedSize()
                            }
                            .onTapGesture {
                                withAnimation { viewModel.updateSelectedPlace(location) }
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
                                withAnimation { viewModel.addLocation() }
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
                } else {
                    Button("Unlock Bucketlist") { viewModel.authenticate() }
                        .padding()
                        .background(.blue)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            .cornerRadius(10)
            .shadow(radius: 5)
            .sheet(item: $viewModel.selectedPlace) { place in
                EditView(location: place) { newLocation in
                    withAnimation {
                        viewModel.updateLocation(newLocation)
                    }
                }
            }
        }
        .padding(.all, 5)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
