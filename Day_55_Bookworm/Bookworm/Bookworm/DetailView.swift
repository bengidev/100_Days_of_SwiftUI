//
//  DetailView.swift
//  Bookworm
//
//  Created by Bambang Tri Rahmat Doni on 23/09/23.
//

import CoreData
import SwiftUI

struct DetailView: View {
    /// Showing book details
    /// 
    let book: Book
    
    /// Using an alert to pop a NavigationLink programmatically
    ///
    @Environment(\.managedObjectContext) private var moc
    @Environment(\.dismiss) private var dismiss
    @State private var showingDeleteAlert = false
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre ?? "Fantasy")
                    .resizable()
                    .scaledToFit()
                
                Text(book.genre?.uppercased() ?? "FANTASY")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundColor(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .offset(x: -5, y: -5)
            }
            
            Text(book.author ?? "Unknown Author")
                .font(.title)
                .foregroundColor(.secondary)
            
            Text(book.review ?? "No Review")
                .padding()
            
            RatingView(rating: .constant(Int(book.rating)))
                .font(.largeTitle)
        }
        .navigationTitle(book.title ?? "Unknown Book")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Delete Book", isPresented: $showingDeleteAlert) {
            Button("Delete", role: .destructive, action: deleteBook)
            Button("Cancel", role: .cancel, action: {})
        } message: {
            Text("Are you sure?")
        }
        .toolbar {
            Button {
                showingDeleteAlert = true
            } label: {
                Label("Delete this book", systemImage: "trash")
            }

        }

    }
    
    /// Using an alert to pop a NavigationLink programmatically
    ///
    private func deleteBook() -> Void {
        moc.delete(book)
        
        // Uncomment this line if you want to make
        // the deletion permanent
        try? moc.save()
        dismiss()
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
//
//    static var previews: some View {
//        let book = Book(context: moc)
//        book.title = "Test book"
//        book.author = "Test author"
//        book.genre = "Fantasy"
//        book.rating = 4
//        book.review = "This was a great book. I really enjoyed it."
//
//        return NavigationView {
//            DetailView(book: book)
//        }
//    }
//}
