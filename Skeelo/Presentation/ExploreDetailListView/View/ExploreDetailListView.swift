//
//  ExploreDetailListView.swift
//  Skeelo
//
//  Created by Maxwell Farias on 01/05/24.
//

import SwiftUI

struct ExploreDetailListView: View {
    
    @StateObject var viewModel: ExploreDetailListViewModel = ExploreDetailListViewModel()
    
    let id: String
    var body: some View {
        List(viewModel.books, id: \.key) { book in
            HStack {
                Text(book.authors[0].name)
            }
        }
        .onAppear {
            viewModel.fecthCategory(id: id)
        }
        
    }
    
}

#Preview {
    ExploreDetailListView(id: "science")
}
