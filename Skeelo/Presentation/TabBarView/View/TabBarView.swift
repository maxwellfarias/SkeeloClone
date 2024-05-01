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
                Text("Bookshelf")
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Bookshelf")
                }
                
                ExploreView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Explore")
                }
            }
            .tint(SkeeloColor.mainGreen)
        }
        .toolbarTitleDisplayMode(.inline)
        .background(.white)
    }
}

#Preview {
    TabBarView()
}
