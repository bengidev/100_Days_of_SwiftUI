//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Bambang Tri Rahmat Doni on 23/09/23.
//

import SwiftUI

struct CheckoutView: View {
    /// Preparing for checkout
    ///
    @ObservedObject var order: Order

    var body: some View {
        /// Preparing for checkout
        ///
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg")) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView("Loading your image...")
                }
                .frame(height: 233)

                Text("Your total is \(order.cost, format: .currency(code: "USD"))")
                    .font(.title)
                
                Button("Place Order", action: {})
                    .padding()
            }
        }
        .navigationTitle("Checkout Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
