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
    @Published var errorToast: Toast? = nil
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
            case .failure(let error):
                self.isLoading = false
                self.errorToast = Toast(type: .error, title: "Oops! Something went wrong.", message: "It seems that we're having trouble loading the content right now due to the following error: \(error.localizedDescription)", duration: 10.0)
            }
        }
    }
}
