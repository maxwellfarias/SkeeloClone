//
//  BookThemeModel.swift
//  Skeelo
//
//  Created by Maxwell Farias on 30/04/24.
//

import Foundation

struct Works: Decodable {
    var works: [BookByTheme] = []
}

struct BookByTheme: Decodable {
    var key: String = ""
    var title: String = ""
    var cover_id: String = ""
    var authors: [author] = []
}

struct author: Decodable {
    var key: String = ""
    var name: String = ""
}
