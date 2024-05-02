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
    var key: String?
    var title: String?
    var cover_id: Int?
    var authors: [Author] = []
    
    func getAllAuthors() -> String {
        var allAuthorsString = ""
        for author in authors {
            if let name = author.name {
                allAuthorsString = name + ", "
            }
        }
        return String(allAuthorsString.dropLast(2).trimmingCharacters(in: .whitespacesAndNewlines))
    }
}

struct Author: Decodable {
    var key: String?
    var name: String?
}
