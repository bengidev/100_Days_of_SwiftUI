//
//  ImageSaver.swift
//  Instafilter
//
//  Created by Bambang Tri Rahmat Doni on 24/09/23.
//

import SwiftUI

/// How to save images to the user’s photo library
/// 
class ImageSaver: NSObject {
    func writeToPhotoAlbum(image: UIImage) -> Void {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
    }
    
    @objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) -> Void {
        if error != nil {
            print("Save image failed, with Error: \(String(describing: error?.localizedDescription))")
        } else {
            print("Save image finished, with imageDetail: \(image.description)")
        }
    }
}
