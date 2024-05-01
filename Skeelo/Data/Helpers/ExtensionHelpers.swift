//
//  ExtensionHelpers.swift
//  Skeelo
//
//  Created by Maxwell Farias on 30/04/24.
//

import Foundation

public extension Data {
    func toModel<T:Decodable>() -> T? {
        return try? JSONDecoder().decode(T.self, from: self)
    }
}
