//
//  ContentView.swift
//  Skeelo
//
//  Created by Maxwell Farias on 30/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ForEach (1..<10) { index in
                NavigationLink  {Text("View \(index)")} label: {
                    Text ("Line \(index)")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
