//
//  HttpPostClient.swift
//  Skeelo
//
//  Created by Maxwell Farias on 30/04/24.
//

import Foundation

public protocol HttpPostClient {
    func fetchBooksByTheme(to url: URL, completion: @escaping (Result<Data?, HttpError>) -> Void)
}
