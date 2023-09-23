//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Bambang Tri Rahmat Doni on 23/09/23.
//

import SwiftUI

struct AddressView: View {
    /// Checking for a valid address
    ///
    @ObservedObject var order: Order
    
    var body: some View {
        /// Checking for a valid address
        ///
        Form {
            Section {
                TextField("Name", text: $order.name)
                TextField("Street Address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zip", text: $order.zip)
            }
            
            Section {
                NavigationLink {
                    CheckoutView(order: order)
                } label: {
                    Text("Check Out")
                }

            }
            .disabled(!order.hasValidAddress)
        }
        .navigationTitle("Delivery Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
