//
//  Movie+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Bambang Tri Rahmat Doni on 24/09/23.
//
//

import Foundation
import CoreData


extension Movie {
    /// Creating NSManagedObject subclasses
    ///
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String?
    @NSManaged public var director: String?
    @NSManaged public var year: Int16

    public var wrappedTitle: String {
        title ?? "Unknown Title"
    }
    
    public var wrappedDirector: String {
        director ?? "Unknown Director"
    }
}

extension Movie : Identifiable {

}
