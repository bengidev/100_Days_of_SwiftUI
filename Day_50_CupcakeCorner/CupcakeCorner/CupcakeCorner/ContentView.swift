//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Bambang Tri Rahmat Doni on 23/09/23.
//

import SwiftUI

struct ContentView: View {
    /// Taking basic order details
    ///
    @StateObject var order = Order()
    
    var body: some View {
        /// Taking basic order details
        ///
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.type) {
                        ForEach(Order.types.indices, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes: \(order.quantity)",
                            value: $order.quantity,
                            in: 3...20)
                }
                
                Section {
                    Toggle("Any special requests?", isOn: $order.specialRequestedEnabled.animation())
                    
                    if order.specialRequestedEnabled {
                        Toggle("Add extra frosting", isOn: $order.extraFrosting)
                        Toggle("Add extra sprinkles", isOn: $order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink {
                        AddressView(order: order)
                    } label: {
                        Text("Delivery Details")
                    }

                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
