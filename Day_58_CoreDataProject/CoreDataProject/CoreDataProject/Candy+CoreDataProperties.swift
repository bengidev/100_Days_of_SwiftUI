//
//  Candy+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Bambang Tri Rahmat Doni on 24/09/23.
//
//

import Foundation
import CoreData


extension Candy {
    /// One-to-many relationships with Core Data, SwiftUI, and @FetchRequest
    ///

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Candy> {
        return NSFetchRequest<Candy>(entityName: "Candy")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: Country?

    public var wrappedName: String {
        name ?? "Unknown Candy"
    }
}

extension Candy : Identifiable {

}
