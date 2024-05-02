//
//  IntExtension.swift
//  Skeelo
//
//  Created by Maxwell Farias on 01/05/24.
//

import Foundation

extension Int {
    func toURL () -> URL? {
        return URL(string: URLConstant.coverURL + "/b/id/" + "\(self)" + "-M.jpg")
    }
}
