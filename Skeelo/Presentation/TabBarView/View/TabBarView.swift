//
//  TabBarView.swift
//  Skeelo
//
//  Created by Maxwell Farias on 01/05/24.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        
        NavigationStack {
            TabView {
                NavigationLink(destination: {
                    Text("First View")
                }, label: {
                    Text("First View")
                })
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("First")
                }
                
                NavigationLink(destination: {
                    Text("Second View")
                }, label: {
                    Text("Second View")
                })
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Second")
                }
                
            }
        }
    }
}

#Preview {
    TabBarView()
}
