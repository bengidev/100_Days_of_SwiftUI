//
//  ImagePicker.swift
//  Instafilter
//
//  Created by Bambang Tri Rahmat Doni on 24/09/23.
//

import PhotosUI
import SwiftUI

/// Wrapping a UIViewController in a SwiftUI view
///
struct ImagePicker: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        
        let picker = PHPickerViewController(configuration: config)
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) { }
}
