//
//  DetailBookViewModel.swift
//  Skeelo
//
//  Created by Maxwell Farias on 11/05/24.
//

import Foundation

class DetailBookViewModel: ObservableObject {
    @Published var book: BookModel?
    @Published var isLoading: Bool = false
    var fetchBookUseCase: FetchBooksUseCaseProtocol
    
    init(book: BookModel? = nil, fetchBookUseCase: FetchBooksUseCaseProtocol = UseCaseFactory.createFetchBooksUseCase()) {
        self.book = book
        self.fetchBookUseCase = fetchBookUseCase
    }
    
    func fetchBook(id: String) {
        isLoading = true
        fetchBookUseCase.fetchBooksById(keyValue: formatIdForSearch(id: id)) { result in
            switch result {
            case .success(let books):
                self.book = books.docs[0]
                self.isLoading = false
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
