//
//  HttpPostClient.swift
//  Skeelo
//
//  Created by Maxwell Farias on 30/04/24.
//

import Foundation

protocol HttpPostClient {
    func fetchBooks(path: Endpoint, keyValue: String, completion: @escaping (Result<Data?, HttpError>) -> Void)
}

enum Endpoint: String {
    case theme = "/subjects/"
    case id = "/search.json?q="
}

