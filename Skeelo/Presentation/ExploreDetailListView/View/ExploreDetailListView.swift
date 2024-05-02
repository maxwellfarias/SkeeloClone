//
//  ExploreDetailListView.swift
//  Skeelo
//
//  Created by Maxwell Farias on 01/05/24.
//

import SwiftUI
import Kingfisher

struct ExploreDetailListView: View {
    
    @StateObject var viewModel: ExploreDetailListViewModel = ExploreDetailListViewModel()
    
    var category: Category
    
    var body: some View {
        
        VStack {
            SKLHeaderView(title: category.name)
                .padding(.leading, 10)
            
            SKLFilterPickerView(tags: ["My Books", "Available for exchange", "Skeelo Store"])
                .padding(.top, 10)
            
            List(viewModel.books, id: \.key) { book in
                HStack {
                    KFImage(book.cover_id?.toURL())
                        .placeholder {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle())
                        }
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 110, height: 160)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text(book.title ?? "")
                            .font(.headline)
                            .padding(.top, 10)
                        
                        Text(book.getAllAuthors())
                            .font(.callout)
                            .foregroundStyle(.gray)
                        
                        HStack {
                            Image(systemName: "handbag")
                                .font(.callout)
                                .foregroundStyle(.red)
                                .background(
                                    Circle()
                                        .frame(width: 30, height: 30)
                                        .foregroundStyle(SkeeloColor.lightRed)
                                )
                            
                            Text("Purchase at the Skeelo Store")
                                .font(.caption)
                                .fontWeight(.medium)
                                .foregroundStyle(.red)
                                .padding(.leading, 8)
                        }
                        
                        HStack {
                            Image(systemName: "book.pages")
                                .font(.callout)
                                .foregroundStyle(SkeeloColor.darkGreen)
                                .background(
                                    Circle()
                                        .frame(width: 30, height: 30)
                                        .foregroundStyle(SkeeloColor.lightGreen)
                                )
                            
                            Text("Purchase at the Skeelo Store")
                                .font(.caption)
                                .fontWeight(.medium)
                                .foregroundStyle(SkeeloColor.darkGreen)
                                .padding(.leading, 8)
                        }
                        
                        Spacer()
                    }
                    .padding(.leading, 10)
                }
                .listRowSeparator(.hidden)
                .padding(.leading, -15)
                .background(.white)
            }
            .listStyle(.plain)
            .scrollIndicators(.hidden)
           
            Spacer()
        }
        .padding(.horizontal, 15)
        .background(.white)
        .navigationBarBackButtonHidden()
        .ignoresSafeArea(edges: .bottom)
        .onAppear {
            viewModel.fecthCategory(id: category.id)
        }
    }
}

#Preview {
    ExploreDetailListView(category: PreviewData.category)
}
