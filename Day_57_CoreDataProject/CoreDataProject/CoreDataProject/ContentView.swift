//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Bambang Tri Rahmat Doni on 24/09/23.
//

import SwiftUI

/// Why does \.self work for ForEach?
///
struct Student: Hashable {
    let name: String
}

struct ContentView: View {
    /// Conditional saving of NSManagedObjectContext
    ///
    @Environment(\.managedObjectContext) private var moc
    @FetchRequest(sortDescriptors: []) private var movies: FetchedResults<Movie>

    /// Why does \.self work for ForEach?
    ///
    private let students = [
        Student(name: "Harry Potter"),
        Student(name: "Hermione Granger"),
    ]

    var body: some View {
        /// Why does \.self work for ForEach?
        ///
//        List {
//            ForEach([2, 4, 6, 8, 10], id: \.self) {
//                Text("\($0) is even")
//            }
//        }

//        List(students, id: \.self) { student in
//            Text(student.name)
//        }
        
        /// Ensuring Core Data objects are unique using constraints
        ///
        VStack {
            List(movies, id: \.self) { movie in
                HStack(alignment: .center, spacing: 10) {
                    Text(movie.wrappedTitle)
                    
                    Divider()
                    
                    VStack {
                        Text(movie.wrappedDirector)
                        
                        Divider()
                        
                        Text("\(movie.year)")
                    }
                }
            }
            
            Button("Add Movie") {
                let movie = Movie(context: moc)
                movie.title = "Movie 1"
                movie.director = "Director 1"
                movie.year = 1990
            }
            
            Button("Save Movie") {
                do {
                    try moc.save()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    private func saveChangedContext() -> Void {
        /// Conditional saving of NSManagedObjectContext
        ///
        if moc.hasChanges {
            try? moc.save()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
