//
//  DetailBookViewModel.swift
//  Skeelo
//
//  Created by Maxwell Farias on 11/05/24.
//

import Foundation

class DetailBookViewModel: ObservableObject {
    @Published var books: [BookModel]
    var fetchBookUseCase: FetchBooksUseCaseProtocol
    
    init(books: [BookModel] = [], fetchBookUseCase: FetchBooksUseCaseProtocol) {
        self.books = books
        self.fetchBookUseCase = fetchBookUseCase
    }
    
    func fetchBook(id: String) {
        fetchBookUseCase.fetchBooksById(keyValue: formatIdForSearch(id: id)) { result in
            switch result {
            case .success(let books):
                self.books = books.docs
            case .failure(let error): break
            }
        }
    }
    
    private func formatIdForSearch(id: String) -> String {
        var formattedID = id.trimmingCharacters(in: .whitespacesAndNewlines)
        formattedID = formattedID.replacingOccurrences(of: " ", with: "+")
        return formattedID
    }
}
