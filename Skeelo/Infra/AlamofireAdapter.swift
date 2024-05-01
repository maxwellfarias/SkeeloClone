//
//  AlamofireAdapter.swift
//  Skeelo
//
//  Created by Maxwell Farias on 30/04/24.
//

import Foundation
import Alamofire


class AlamofireAdapter: HttpPostClient {
    
    let baseURL = "https://openlibrary.org"
    private let session: Session
    
    init(session: Session = .default) {
        self.session = session
    }
    
    func fetchBooksBy(path: Endpoint, keyValue: String, completion: @escaping (Result<Data?, HttpError>) -> Void) {
        guard let url = completeUrl(path: path, keyValue: keyValue) else {
            completion(.failure(.badRequest))
            return
        }
        
        session.request(url).responseData { dataResponse in
            guard let statusCode = dataResponse.response?.statusCode else {return completion(.failure(.noConnectivity))}
            switch dataResponse.result {
            case .failure: completion(.failure(.noConnectivity))
            case .success(let data):
                switch statusCode {
                case 204:
                    completion(.success(nil))
                case 200...299:
                    completion(.success(data))
                case 401:
                    completion(.failure(.unauthorized))
                case 403:
                    completion(.failure(.forbidden))
                case 400...499:
                    completion(.failure(.badRequest))
                case 500...599:
                    completion(.failure(.serverError))
                default: completion(.failure(.noConnectivity))
                }
            }
        }
    }
    
    private func completeUrl(path: Endpoint, keyValue: String) -> URLRequest? {
        let urlString: String
        
        switch path {
        case .id: urlString = baseURL + path.rawValue + keyValue
        case .theme: urlString = baseURL + path.rawValue + keyValue + ".json"
        }
        
        guard let url = URL(string: urlString) else {
            return nil
        }
        return URLRequest(url: url)
    }
}
