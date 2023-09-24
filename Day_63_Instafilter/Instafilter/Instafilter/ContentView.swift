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
    /// Integrating Core Image with SwiftUI
    ///
//    @State private var image: Image?
    
    /// Wrapping a UIViewController in a SwiftUI view
    ///
    @State private var image: Image?
    @State private var showingImagePicker = false
    
    var body: some View {
        /// Integrating Core Image with SwiftUI
        ///
//        VStack(spacing: 10) {
//            image?
//                .resizable()
//                .scaledToFit()
//            Text("Hello, world!")
//        }
//        .padding()
//        .onAppear(perform: loadImage)
        
        /// Wrapping a UIViewController in a SwiftUI view
        ///
        VStack(spacing: 10) {
            image?
                .resizable()
                .scaledToFit()
            
            Button("Select Image") {
                showingImagePicker = true
            }
        }
        .padding()
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker()
        }
    }
    
    /// Integrating Core Image with SwiftUI
    ///
    private func loadImage() -> Void {
        guard let inputImage = UIImage(named: "apple_logo") else { return }
        let beginImage = CIImage(image: inputImage)
        
        let context = CIContext()
        
//        let currentFilter = CIFilter.sepiaTone()
//        currentFilter.inputImage = beginImage
//        currentFilter.intensity = 1
        
//        let currentFilter = CIFilter.pixellate()
//        currentFilter.inputImage = beginImage
//        currentFilter.scale = 100
        
//        let currentFilter = CIFilter.crystallize()
//        currentFilter.inputImage = beginImage
//        currentFilter.radius = 200
        
//        let currentFilter = CIFilter.twirlDistortion()
//        currentFilter.inputImage = beginImage
//        currentFilter.radius = 1000
//        currentFilter.center = CGPoint(x: inputImage.size.width / 2, y: inputImage.size.height / 2)
        
        let currentFilter = CIFilter.twirlDistortion()
        currentFilter.inputImage = beginImage
        
        let amount = 1.0
        let inputKeys = currentFilter.inputKeys
        
        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(amount, forKey: kCIInputIntensityKey)
        }
        
        if inputKeys.contains(kCIInputRadiusKey) {
            currentFilter.setValue(amount * 200, forKey: kCIInputRadiusKey)
        }
        
        if inputKeys.contains(kCIInputScaleKey) {
            currentFilter.setValue(amount * 10, forKey: kCIInputScaleKey)
        }
        
        // Get a CIImage from our filter or exit if that fails
        guard let outputImage = currentFilter.outputImage else { return }
        
        // Attempt to get a CGImage from our CIImage
        if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
            // Convert that to a UIImage
            let uiImage = UIImage(cgImage: cgImage)
            
            // And convert that to a SwiftUI image
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
