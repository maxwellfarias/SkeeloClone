//
//  FetchBooksUseCase.swift
//  Skeelo
//
//  Created by Maxwell Farias on 01/05/24.
//

import Foundation

protocol FetchBooksUseCaseProtocol {
    func fetchBooksById(path: Endpoint, keyValue: String, completion: @escaping (Result<Docs, HttpError>) -> Void)
    func fetchBooksByTheme(path: Endpoint, keyValue: String, completion: @escaping (Result<Works, HttpError>) -> Void)
}

class FetchBooksUseCase: FetchBooksUseCaseProtocol {
    private var httpClient: HttpPostClient
    
    init(httpClient: HttpPostClient) {
        self.httpClient = httpClient
    }
    
    func fetchBooksById(path: Endpoint, keyValue: String, completion: @escaping (Result<Docs, HttpError>) -> Void) {
        httpClient.fetchBooks(path: path, keyValue: keyValue) { result in
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
    
    func fetchBooksByTheme(path: Endpoint, keyValue: String, completion: @escaping (Result<Works, HttpError>) -> Void) {
        httpClient.fetchBooks(path: path, keyValue: keyValue) { result in
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
