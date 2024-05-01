//
//  ContentView.swift
//  Skeelo
//
//  Created by Maxwell Farias on 30/04/24.
//

import SwiftUI

struct ContentView: View {
    let alamofire = AlamofireAdapter()
    
    var body: some View {
        NavigationStack {
            ForEach (1..<10) { index in
                NavigationLink  {Text("View \(index)")} label: {
                    Text ("Line \(index)")
                }
            }
        }
        .onAppear {
            let url = URL(string: "https://openlibrary.org/search.json?q=OL2917168W")!
            alamofire.fetchBooksByTheme(to: url) { result in
                switch result {
                case .success(let data):
                    let books: Docs? = data?.toModel()
                    for book in books!.docs {
                        print(book.title)
                    }
                case .failure(let error): break
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
