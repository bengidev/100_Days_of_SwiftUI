//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Bambang Tri Rahmat Doni on 24/09/23.
//

import CoreData
import SwiftUI

struct FilteredList<T: NSManagedObject, Content: View>: View {
    /// Dynamically filtering @FetchRequest with SwiftUI
    ///
    @FetchRequest private var fetchRequest: FetchedResults<T>
    
    // This is our content closure.
    // We'll call this once for each item in the list.
    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequest, id: \.self) { singer in
            self.content(singer)
        }
    }
    
    init(filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
        _fetchRequest = FetchRequest<T>(sortDescriptors: [],
                                        predicate: NSPredicate(format: "%K BEGINSWITH %@",
                                                               filterKey,
                                                               filterValue))
        self.content = content
    }
}
