//
//  PreviewData.swift
//  Skeelo
//
//  Created by Maxwell Farias on 01/05/24.
//

import Foundation

class PreviewData {
    static var category: Category = Category(id: "classics",
                                             cover_name: "classics_category",
                                             name: "Classics")
    
    static var bookTheme: BookByTheme = BookByTheme(
        key: "1984",
        title: "1984",
        cover_id: 0,
    authors: [Author(key: "1984", name: "1984")])

    
    static var detailBook: BookModel = BookModel(
        title: "The Lord of the Rings",
        cover_i: 8474036,
        author_name: ["J.R.R. Tolkien"],
        number_of_pages_median: 440,
        publisher: [
            "Martins Fontes",
            "Distribooks Int'l+inc",
            "Gramedia Pustaka Utama",
            "Quality Paperback Book Club",
            "Booket",
            "Ediciones Trabe",
            "Hermes Editorial",
            "GALLIMARD JEUNE",
            "Argo",
            "Unwin Paperbacks",
            "Europa-America",
            "Minotauro",
            "Methuen Publications",
            "Klett-Cotta Hobbit Presse",
            "Harpercollins",
            "Klett-Cotta",
            "Easton Press"],
        ratings_average: 4.353261,
        ratings_count: 184,
        first_publish_year: 1950,
        edition_count: 417, isbn: [
            "9781782011095",
            "9780061917783",
            "9782253032939",
            "0395282659",
            "5699006001",
            "8700050210",
            "5170162715",
            "8445005901",
            "0007457820",
            "9780458938803",
            "9780007156993",
            "0544164229",
            "9780007440849",
            "9780708980651",
            "0007270615",
            "8025707415",
            "9788445002322"],
        subject: [
            "The Lord of the Rings",
            "Fiction",
            "Ficción",
            "English Fantasy fiction",
            "Ficción fantástica inglesa",
            "Fantasy fiction",
            "Open Library Staff Picks",
            "Middle Earth (Imaginary place)",
            "Fiction, fantasy, epic",
            "Middle earth (imaginary place), fiction",
            "Baggins, frodo (fictitious character), fiction",
            "Gandalf (fictitious character), fiction",
            "British and irish fiction (fictional works by one author)",
            "English literature",
            "Frodo Baggins (Fictitious character)",
            "Frodo Baggins (Fictitious character)",
            "Baggins, bilbo (fictitious character), fiction",
            "Fiction, fantasy, general",
            "English language",
            "Fiction, media tie-in",
            "Gift books",
            "Quests (Expeditions)",
            "Wizards",
            "Terre du Milieu (Lieu imaginaire)"],
        person: [
            "Frodo Baggins",
            "Samwise Gamgee",
            "Meriadoc Brandybuck",
            "Peregrin Took",
            "Gandalf the Grey",
            "Aragorn",
            "Legolas Greenleaf",
            "Gimli",
            "Boromir",
            "Denethor",
            "Faramir",
            "Galadriel",
            "Celeborn",
            "Elrond",
            "Arwen Undómiel",
            "Bilbo Baggins",
            "Théoden",
            "Éomer",
            "Éowyn",
            "Treebeard",
            "Tom Bombadil",
            "King Thranduil",
            "Silvan Elves",
            "Sauron",
            "Elves of Eregion",
            "the Nazgûl",
            "The Witch-king of Angmar",
            "Saruman the White",
            "Gríma Wormtongue",
            "Gollum",
            "Shelob",
            "Durin's Bane",
            "Mouth of Sauron"],
        first_sentence: [
            "CE livre traite dans une large mesure des Hobbits, et Ie lecteur découvrira dans ses pages une bonne part de leur caractére et un peu de leur histoire.",
            "This book is largely concerned with Hobbits, and from its pages a reader may discover much of their character and a little of their history.",
            "Diese Erzählung wuchs und wuchs, während ich sie erzählte, bis sie zur Geschichte des Großen Ringkrieges wurde, in der immer wieder die noch altere Geschichte flüchtig auftauchte.",
            "Quando o Sr. Bilbo Bolseiro de Bolsão anunciou que em breve celebraria seu onzentésimo primeiro aniversário com uma festa de especial grandeza, houve muito comentário e agitação na Vila dos Hobbits."
            ],
        language: [
            "eng",
            "ind",
            "gag",
            "bul",
            "por",
            "dan",
            "scr",
            "ast",
            "nor",
            "rus",
            "hun",
            "dut",
            "hrv",
            "ger",
            "fre",
            "pol",
            "chi",
            "yid",
            "tur",
            "ita",
            "spa"
            ])
}