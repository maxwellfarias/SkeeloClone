//
//  ExploreViewModel.swift
//  Skeelo
//
//  Created by Maxwell Farias on 01/05/24.
//

import Foundation

class ExploreDetailListViewModel: ObservableObject {
    @Published var books: [BookByTheme] = []
    @Published var isLoading: Bool = false
    var useCase: FetchBooksUseCaseProtocol
    
    init(useCase: FetchBooksUseCaseProtocol = UseCaseFactory.createFetchBooksUseCase()) {
        self.useCase = useCase
    }
    
    func fecthCategory(id: String) {
        isLoading = true
        useCase.fetchBooksByTheme(keyValue: id) { result in
            switch result {
            case .success(let works):
                self.isLoading = false
                self.books = works.works
            case .failure(let error): break
            }
        }
    }
}
