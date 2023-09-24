//
//  ContentView.swift
//  Instafilter
//
//  Created by Bambang Tri Rahmat Doni on 24/09/23.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct ContentView: View {
    /// Building our basic UI
    ///
    @State private var image: Image?
    @State private var filterIntensity = 0.5
    
    /// Importing an image into SwiftUI using PHPickerViewController
    ///
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    /// Basic image filtering using Core Image
    ///
    @State private var currentFilter = CIFilter.sepiaTone()
    private let context = CIContext()
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(.secondary)
                    
                    Text("Tap to select a picture")
                        .foregroundColor(.white)
                        .font(.headline)
                    
                    image?
                        .resizable()
                        .scaledToFit()
                }
                .cornerRadius(10)
                .onTapGesture(perform: onSelectImage)
                
                HStack {
                    Text("Intensity")
                    Slider(value: $filterIntensity)
                        .onChange(of: filterIntensity) { _ in applyProcessing() }
                }
                .padding(.vertical)
                
                HStack {
                    Button("Change Filter", action: onChangeFilter)
                    
                    Spacer()
                    
                    Button("Save", action: onSavePicture)
                }
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("Instafilter")
            .onChange(of: inputImage) { _ in onLoadImage() }
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $inputImage)
            }
        }
    }
    
    /// Importing an image into SwiftUI using PHPickerViewController
    ///
    private func onSelectImage() -> Void {
        withAnimation {
            showingImagePicker = true
        }
    }
    
    private func onChangeFilter() -> Void {
        
    }
    
    private func onLoadImage() -> Void {
        guard let inputImage = inputImage else { return }
        
        let beginImage = CIImage(image: inputImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        
        applyProcessing()
    }
    
    private func onSavePicture() -> Void {
        
    }
    
    private func applyProcessing() -> Void {
        currentFilter.intensity = Float(filterIntensity)
        
        guard let outputImage = currentFilter.outputImage else { return }
        
        if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgImage)
            
            withAnimation {
                image = Image(uiImage: uiImage)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
