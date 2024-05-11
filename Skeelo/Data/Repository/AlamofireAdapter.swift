//
//  AlamofireAdapter.swift
//  Skeelo
//
//  Created by Maxwell Farias on 30/04/24.
//

import Foundation
import Alamofire


class AlamofireAdapter: HttpPostClient {
    
    private let session: Session
    
    init(session: Session = .default) {
        self.session = session
    }
    
    func fetchBooksById(keyValue: String, completion: @escaping (Result<Data?, HttpError>) -> Void) {
        let urlString = URLConstant.baseURLForID + keyValue
        guard let url =  URL(string: urlString) else {
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
    
    func fetchBooksByTheme(keyValue: String, completion: @escaping (Result<Data?, HttpError>) -> Void) {
        let urlString = URLConstant.baseURLForTheme + keyValue + ".json"
        guard let url =  URL(string: urlString) else {
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
}
