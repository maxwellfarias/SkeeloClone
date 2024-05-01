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
            alamofire.fetchBooksBy(path:.theme, keyValue: "war") { result in
                switch result {
                case .success(let data):
                    let books: Works? = data?.toModel()
                    for book in books!.works {
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
