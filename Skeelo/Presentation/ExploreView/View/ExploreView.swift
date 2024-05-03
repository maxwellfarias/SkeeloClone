//
//  ExploreView.swift
//  Skeelo
//
//  Created by Maxwell Farias on 01/05/24.
//

import SwiftUI

struct ExploreView: View {
    let categories: [Category] = try! Bundle.main.decode("categories.json")
    
    var body: some View {
        VStack(spacing: 0) {
            
            Text("Explore")
                .font(.subheadline)
                .fontWeight(.semibold)
            
            ZStack(alignment: .trailing) {
                
                NavigationLink {
                    Text("Another View")
                } label: {
                    Text ("What would you like to read?")
                        .font(.subheadline)
                        .fontWeight(.light)
                        .foregroundStyle(SkeeloColor.lightGray100)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .stroke(SkeeloColor.lightGray, lineWidth: 1)
                            .frame(height: 40))
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.black)
                        .font(.title3)
                        .padding(.trailing, 15)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.bottom, 10)
            .padding(.top, 7)
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: Array(repeating: .init(.flexible()), count:2), alignment: .center, spacing: 10) {
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
            }
            
            Spacer()
        }
        .padding(.horizontal, 15)
        .padding(.top, 12)
        .background(.white)
        
    }
}

#Preview {
    NavigationStack {
        ExploreView()
    }
}
