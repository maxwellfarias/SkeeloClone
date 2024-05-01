//
//  RepositoryFactory.swift
//  Skeelo
//
//  Created by Maxwell Farias on 01/05/24.
//

import Foundation

protocol UseCaseFactoryProtocol {
    static func createFetchBooksUseCase () -> FetchBooksUseCaseProtocol
}

class UseCaseFactory: UseCaseFactoryProtocol {
    static func createFetchBooksUseCase() -> FetchBooksUseCaseProtocol {
        return FetchBooksUseCase(httpClient: AlamofireAdapter())
    }
}
