//
//  ContentView.swift
//  Skeelo
//
//  Created by Maxwell Farias on 30/04/24.
//

import SwiftUI

struct ContentView: View {
    let useCase = FetchBooksUseCase(httpClient: AlamofireAdapter())
    
    var body: some View {
        NavigationStack {
            ForEach (1..<10) { index in
                NavigationLink  {Text("View \(index)")} label: {
                    Text ("Line \(index)")
                }
            }
        }
        .onAppear {
            useCase.fetchBooksByTheme (path: .theme, keyValue: "love") { result in
                switch result {
                case .success(let books): print(books.works)
                case .failure(let error): break
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
