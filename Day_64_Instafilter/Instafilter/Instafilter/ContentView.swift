//
//  ContentView.swift
//  Instafilter
//
//  Created by Bambang Tri Rahmat Doni on 24/09/23.
//

import SwiftUI

struct ContentView: View {
    /// Using coordinators to manage SwiftUI view controllers
    ///
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State private var showingImagePicker = false
    
    var body: some View {
        VStack(spacing: 10) {
            image?
                .resizable()
                .scaledToFit()
            
            Button("Select Image") {
                showingImagePicker = true
            }
            
            /// How to save images to the user’s photo library
            /// 
            Button("Save Image") {
                guard let inputImage = inputImage else { return }
                
                let imageSaver = ImageSaver()
                imageSaver.writeToPhotoAlbum(image: inputImage)
            }
        }
        .padding()
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $inputImage)
        }
        .onChange(of: inputImage) { _ in loadImage() }
    }
    
    private func loadImage() -> Void {
        guard let inputImage = inputImage else { return }
        
        withAnimation {
            image = Image(uiImage: inputImage)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
