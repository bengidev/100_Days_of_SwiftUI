//
//  ImageSaver.swift
//  Instafilter
//
//  Created by Bambang Tri Rahmat Doni on 24/09/23.
//

import SwiftUI

/// Saving the filtered image using UIImageWriteToSavedPhotosAlbum()
///
class ImageSaver: NSObject {
    var successHandler: (() -> Void)?
    var errorHandler: ((Error) -> Void)?
    
    func writeToPhotoAlbum(image: UIImage) -> Void {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
    }
    
    @objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) -> Void {
        if let error = error {
            errorHandler?(error)
        } else {
            successHandler?()
        }
    }
}
