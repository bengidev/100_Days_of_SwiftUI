//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Bambang Tri Rahmat Doni on 24/09/23.
//

import SwiftUI

struct ContentView: View {
    /// Filtering @FetchRequest using NSPredicate
    ///
//    @Environment(\.managedObjectContext) private var moc
//    @FetchRequest(sortDescriptors: [], predicate: nil) private var ships: FetchedResults<Ship>

//    @FetchRequest(sortDescriptors: [],
//                  predicate: NSPredicate(format: "universe == 'Star Wars'")) private var ships: FetchedResults<Ship>

//    @FetchRequest(sortDescriptors: [],
//                  predicate: NSPredicate(format: "universe == %@", "Star Wars")) private var ships: FetchedResults<Ship>
    
//    @FetchRequest(sortDescriptors: [],
//                  predicate: NSPredicate(format: "name < %@", "F")) private var ships: FetchedResults<Ship>
    
//    @FetchRequest(sortDescriptors: [],
//                  predicate: NSPredicate(format: "universe IN %@", ["Aliens", "Firefly", "Star Trek"])) private var ships: FetchedResults<Ship>
    
//    @FetchRequest(sortDescriptors: [],
//                  predicate: NSPredicate(format: "name BEGINSWITH %@", "E")) private var ships: FetchedResults<Ship>
    
//    @FetchRequest(sortDescriptors: [],
//                  predicate: NSPredicate(format: "name BEGINSWITH[c] %@", "e")) private var ships: FetchedResults<Ship>
    
//    @FetchRequest(sortDescriptors: [],
//                  predicate: NSPredicate(format: "NOT name BEGINSWITH[c] %@", "e")) private var ships: FetchedResults<Ship>
    
    /// Dynamically filtering @FetchRequest with SwiftUI
    ///
//    @Environment(\.managedObjectContext) private var moc
//    @State private var lastNameFilter = "A"

    /// One-to-many relationships with Core Data, SwiftUI, and @FetchRequest
    ///
    @Environment(\.managedObjectContext) private var moc
    @FetchRequest(sortDescriptors: []) private var countries: FetchedResults<Country>
    
    var body: some View {
        /// Filtering @FetchRequest using NSPredicate
        ///
//        VStack {
//            List(ships, id: \.self) { ship in
//                Text(ship.name ?? "Unknown Ship")
//                Text(ship.universe ?? "Unknown Universe")
//            }
//
//            Button("Add Ship") {
//                let ship1 = Ship(context: moc)
//                ship1.name = "Enterprise"
//                ship1.universe = "Star Trek"
//
//                let ship2 = Ship(context: moc)
//                ship2.name = "Defiant"
//                ship2.universe = "Star Trek"
//
//                let ship3 = Ship(context: moc)
//                ship3.name = "Millenium Falcon"
//                ship3.universe = "Star Wars"
//
//                let ship4 = Ship(context: moc)
//                ship4.name = "Executor"
//                ship4.universe = "Star Wars"
//
//                try? moc.save()
//            }
//        }
        
        /// Dynamically filtering @FetchRequest with SwiftUI
        ///
//        VStack(spacing: 20) {
//            FilteredList(filterKey: "lastName", filterValue: lastNameFilter) { (singer: Singer) in
//                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
//            }
//
//            Button("Add Singer") {
//                let taylor = Singer(context: moc)
//                taylor.firstName = "Taylor"
//                taylor.lastName = "Swift"
//
//                let ed = Singer(context: moc)
//                ed.firstName = "Ed"
//                ed.lastName = "Sheeran"
//
//                let adele = Singer(context: moc)
//                adele.firstName = "Adele"
//                adele.lastName = "Adkins"
//
//                try? moc.save()
//            }
//
//            Button("Show A Singer") {
//                lastNameFilter = "A"
//            }
//
//            Button("Show S Singer") {
//                lastNameFilter = "S"
//            }
//        }.padding(.bottom)
        
        /// One-to-many relationships with Core Data, SwiftUI, and @FetchRequest
        ///
        VStack(spacing: 10) {
            List {
                ForEach(countries, id: \.self) { country in
                    Section(country.wrappedFullName) {
                        ForEach(country.wrappedCandyArray, id: \.self) { candy in
                            Text(candy.wrappedName)
                        }
                    }
                }
            }
            
            Button("Add Candy") {
                let candy1 = Candy(context: moc)
                candy1.name = "Mars"
                candy1.origin = Country(context: moc)
                candy1.origin?.shortName = "UK"
                candy1.origin?.fullName = "United Kingdom"
                
                let candy2 = Candy(context: moc)
                candy2.name = "KitKat"
                candy2.origin = Country(context: moc)
                candy2.origin?.shortName = "UK"
                candy2.origin?.fullName = "United Kingdom"
                
                let candy3 = Candy(context: moc)
                candy3.name = "Twix"
                candy3.origin = Country(context: moc)
                candy3.origin?.shortName = "UK"
                candy3.origin?.fullName = "United Kingdom"
                
                let candy4 = Candy(context: moc)
                candy4.name = "Toblerone"
                candy4.origin = Country(context: moc)
                candy4.origin?.shortName = "CH"
                candy4.origin?.fullName = "Switzerland"
                
                try? moc.save()
            }
        }.padding(.bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
