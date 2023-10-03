//
//  ResortDetailsView.swift
//  SnowSeeker
//
//  Created by Bambang Tri Rahmat Doni on 04/10/23.
//

import SwiftUI

/// Creating a secondary view for NavigationView
///
struct ResortDetailsView: View {
    let resort: Resort
    
    var body: some View {
        Group {
            VStack {
                Text("Size")
                    .font(.caption.bold())
                    Text(size)
                    .font(.title3)
            }
            
            VStack {
                Text("Price")
                    .font(.caption.bold())
                Text(price)
                    .font(.title3)
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    var size: String {
        switch resort.size {
        case 1:
            return "Small"
        case 2:
            return "Average"
        default:
            return "Large"
        }
    }
    
    var price: String {
        String(repeating: "$", count: resort.price)
    }
}

struct ResortDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ResortDetailsView(resort: Resort.example)
    }
}
