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
    var cover_id: Int = 0
    var authors: [Author] = []
}

struct Author: Decodable {
    var key: String = ""
    var name: String = ""
}
