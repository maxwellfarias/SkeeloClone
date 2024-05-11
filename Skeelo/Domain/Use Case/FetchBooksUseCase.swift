//
//  FetchBooksUseCase.swift
//  Skeelo
//
//  Created by Maxwell Farias on 01/05/24.
//

import Foundation

protocol FetchBooksUseCaseProtocol {
    func fetchBooksById(keyValue: String, completion: @escaping (Result<Docs, HttpError>) -> Void)
    func fetchBooksByTheme(keyValue: String, completion: @escaping (Result<Works, HttpError>) -> Void)
}

class FetchBooksUseCase: FetchBooksUseCaseProtocol {
    private var httpClient: HttpPostClient
    
    init(httpClient: HttpPostClient) {
        self.httpClient = httpClient
    }
    
    func fetchBooksById(keyValue: String, completion: @escaping (Result<Docs, HttpError>) -> Void) {
        httpClient.fetchBooksById(keyValue: keyValue) { result in
            switch result {
            case .success(let data):
                guard let books: Docs = data?.toModel() else {
                    completion(.failure(.parsingError))
                    return
                }
                completion(.success(books))
            case .failure(let error): completion(.failure(error))
            }
        }
    }
    
    func fetchBooksByTheme(keyValue: String, completion: @escaping (Result<Works, HttpError>) -> Void) {
        httpClient.fetchBooksByTheme(keyValue: keyValue) { result in
            switch result {
            case .success(let data):
                guard let books: Works = data?.toModel() else {
                    completion(.failure(.parsingError))
                    return
                }
                completion(.success(books))
            case .failure(let error): completion(.failure(error))
            }
        }
    }
}
