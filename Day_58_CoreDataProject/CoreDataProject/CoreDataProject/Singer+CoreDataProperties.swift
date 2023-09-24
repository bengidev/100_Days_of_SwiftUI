//
//  Singer+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Bambang Tri Rahmat Doni on 24/09/23.
//
//

import Foundation
import CoreData


extension Singer {
    /// Dynamically filtering @FetchRequest with SwiftUI
    ///

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Singer> {
        return NSFetchRequest<Singer>(entityName: "Singer")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    
    public var wrappedFirstName: String {
        firstName ?? "Unknown Singer"
    }
    
    public var wrappedLastName: String {
        lastName ?? "Unknown Singer"
    }
}

extension Singer : Identifiable {

}
