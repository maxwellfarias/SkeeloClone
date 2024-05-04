//
//  BookModel.swift
//  Skeelo
//
//  Created by Maxwell Farias on 01/05/24.
//

import Foundation

struct Docs: Decodable {
    var docs: [BookModel] = []
}

struct BookModel: Decodable {
    var title: String = ""
    var cover_i: Int?
    var author_name: [String]
    var number_of_pages_median: Int?
    var publisher: [String]?
    var ratings_average: Float?
    var ratings_count: Int?
    var first_publish_year: Int?
    var edition_count: Int?
    var isbn: [String]?
    var subject: [String]?
    var person: [String]?
    var first_sentence: [String]?
    var language: [String]?
    
    func getString(datas: [String]?) -> String {
        var allDatasTogether = ""
        
        if let datas = datas {
            for data in datas {
                allDatasTogether = allDatasTogether + data + ", "
            }
        }
        return String(allDatasTogether.dropLast(2).trimmingCharacters(in: .whitespacesAndNewlines))
    }
}
