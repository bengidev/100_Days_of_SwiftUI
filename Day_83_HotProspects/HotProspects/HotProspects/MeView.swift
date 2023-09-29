//
//  MeView.swift
//  HotProspects
//
//  Created by Bambang Tri Rahmat Doni on 30/09/23.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct MeView: View {
    /// Generating and scaling up a QR code
    ///
    @State private var name = "Anonymous"
    @State private var emailAddress = "you@yoursite.com"

    private let context = CIContext()
    private let filter = CIFilter.qrCodeGenerator()

    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                    .textContentType(.name)
                    .font(.title)

                TextField("Email Address", text: $emailAddress)
                    .textContentType(.emailAddress)
                    .font(.title)

                HStack(alignment: .center) {
                    Spacer()
                    Image(uiImage: generateQRCode(from: "\(name)\n\(emailAddress)"))
                        .interpolation(.none)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                    Spacer()
                }
            }
            .navigationTitle("Your Title")
        }
    }

    /// Generating and scaling up a QR code
    ///
    private func generateQRCode(from string: String) -> UIImage {
        filter.message = Data(string.utf8)

        if let outputImage = filter.outputImage {
            if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgImage)
            }
        }

        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}

struct MeView_Previews: PreviewProvider {
    static var previews: some View {
        MeView()
    }
}
