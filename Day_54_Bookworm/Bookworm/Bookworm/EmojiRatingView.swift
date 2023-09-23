//
//  EmojiRatingView.swift
//  Bookworm
//
//  Created by Bambang Tri Rahmat Doni on 23/09/23.
//

import SwiftUI

struct EmojiRatingView: View {
    /// Building a list with @FetchRequest
    /// 
    let rating: Int16
    
    var body: some View {
        switch rating {
        case 1:
            Text("😭")
        case 2:
            Text("🙁")
        case 3:
            Text("🙂")
        case 4:
            Text("😁")
        default:
            Text("🤩")
        }
    }
}

struct EmojiRatingView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiRatingView(rating: 3)
    }
}
