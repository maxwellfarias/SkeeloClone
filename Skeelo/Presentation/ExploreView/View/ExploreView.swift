//
//  ExploreView.swift
//  Skeelo
//
//  Created by Maxwell Farias on 01/05/24.
//

import SwiftUI

struct ExploreView: View {
    
    @State private var gridLayout: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    let categories: [Category] = try! Bundle.main.decode("categories.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    func gridSwitch() {
        withAnimation(.easeIn) {
            gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
            gridColumn = gridLayout.count
        }
        
        switch gridColumn {
        case 1:
            toolbarIcon = "rectangle.grid.1x2"
        case 2:
            toolbarIcon = "square.grid.2x2"
        case 3:
            toolbarIcon = "square.grid.3x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }
    
    
    var body: some View {
        NavigationStack {
            VStack {
                
                
                
                //            SearchBarView()
                
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                        ForEach(categories, id: \.id) { category in
                            NavigationLink(destination: ExploreDetailListView(category: category)) {
                                Image(category.cover_name)
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(12)
                            }
                        }
                    }
                                        .padding(.top, 15)
                    .padding(.bottom, 30)
                }
                
            }
            .padding([.horizontal, .bottom], 15)
            .background(.white)
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Button(action: {
                            haptics.impactOccurred()
                            gridSwitch()
                        }) {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(SkeeloColor.mainGreen)
                        }
                    }
                }
            }
            .border(Color.black)
            
            
        }
    }
}

#Preview {
    NavigationStack {
        ExploreView()
    }
}
