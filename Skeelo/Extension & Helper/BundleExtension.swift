//
//  BundleExtension.swift
//  Skeelo
//
//  Created by Maxwell Farias on 01/05/24.
//

import Foundation

enum DataError: LocalizedError {
    case failedToLoadFileFromBundle
    case failedToDecodeFromBundle
}


extension Bundle {
    func decode<T: Codable>(_ file: String) throws -> T {
        
    guard let url = self.url(forResource: file, withExtension: nil) else {
        throw DataError.failedToLoadFileFromBundle
    }
        
    guard let data = try? Data(contentsOf: url) else {
        throw DataError.failedToLoadFileFromBundle
    }

    let decoder = JSONDecoder()
    
    guard let loaded = try? decoder.decode(T.self, from: data) else {
        throw DataError.failedToDecodeFromBundle
    }
        
    return loaded
  }
}
