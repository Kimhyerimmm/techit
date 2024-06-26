//
//  ContentView.swift
//  BookShelf
//
//  Created by 김혜림 on 6/17/24.
//

import SwiftUI

class BooksViewModel: ObservableObject {
    @Published var books: [Book] = Book.sampleBooks
}

struct BookListView: View {
    @StateObject var booksViewModel = BooksViewModel()
    
    var body: some View {
        NavigationStack {
            List($booksViewModel.books) { $book in
                NavigationLink(destination: BookDetailView(book: $book)) {
                    BookRowView(book: book)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Books")
        }
    }
}

#Preview {
    BookListView()
}

//이전코드
//struct ContentView_Previews: PreviewProvider {
//  static var previews: some View {
//    ContentView()
//      .previewLayout(.sizeThatFits)
//  }
//}
