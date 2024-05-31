//
//  Tab.swift
//  Skeelo
//
//  Created by Maxwell Farias on 20/05/24.
//

import Foundation

enum Tab: String, CaseIterable {
    case home = "Home"
    case bookshelf = "Bookshelf"
    case explore = "Explore"
    case profile = "Profile"
    
    var systemImage: String {
        switch self {
        case .home:
            return "house"
        case .bookshelf:
            return "square.grid.2x2"
        case .explore:
            return "magnifyingglass"
        case .profile:
            return "person.crop.circle"
        }
    }
}
