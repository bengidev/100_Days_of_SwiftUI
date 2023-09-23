//
//  ContentView.swift
//  Bookworm
//
//  Created by Bambang Tri Rahmat Doni on 23/09/23.
//

import SwiftUI

struct ContentView: View {
    /// Sorting fetch requests with SortDescriptor
    ///
    @Environment(\.managedObjectContext) private var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.title),
        SortDescriptor(\.author)
    ]) private var books: FetchedResults<Book>

    @State private var showingAddScreen = false

    var body: some View {
        NavigationView {
            List {
                ForEach(books) { book in
                    NavigationLink {
                        /// Showing book details
                        ///
                        DetailView(book: book)
                    } label: {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)

                            VStack(alignment: .leading) {
                                Text(book.title ?? "Unknown Title")
                                    .font(.headline)
                                Text(book.author ?? "Unknown Author")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                /// Deleting from a Core Data fetch request
                ///
                .onDelete(perform: deleteBooks)
            }
            .navigationTitle("Bookworm")
            .toolbar {
                /// Deleting from a Core Data fetch request
                ///
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddScreen.toggle()
                    } label: {
                        Label("Add Book", systemImage: "plus")
                    }
                }
            }
        }
        .sheet(isPresented: $showingAddScreen) {
            AddBookView()
        }
    }
    
    /// Deleting from a Core Data fetch request
    /// 
    private func deleteBooks(at offsets: IndexSet) -> Void {
        for offset in offsets {
            // Find this book in our fetch request
            let book = books[offset]
            
            // Delete it from the context
            moc.delete(book)
        }
        
        // Save the context
        try? moc.save()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
