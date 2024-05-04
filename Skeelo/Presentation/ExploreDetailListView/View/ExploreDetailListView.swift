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
                .padding([.top, .leading], 10)
            
            List(1..<2) { book in
                NavigationLink {DetailBookView(book: PreviewData.detailBook, category: category)} label: {
                    HStack {
                        KFImage(URL(string: "https://edit.org/images/cat/book-covers-big-2019101610.jpg"))
                            .placeholder {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle())
                            }
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 105, height: 150)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text(PreviewData.bookTheme.title ?? "")
                                .foregroundStyle(.black)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.top, 10)
                            
                            Text(PreviewData.bookTheme.getAllAuthors())
                                .font(.subheadline)
                                .fontWeight(.light)
                                .foregroundStyle(.gray)
                            
                            HStack {
                                Image(systemName: "handbag")
                                    .font(.footnote)
                                    .foregroundStyle(.red)
                                    .background(
                                        Circle()
                                            .frame(width: 25, height: 25)
                                            .foregroundStyle(SkeeloColor.lightRed)
                                    )
                                    .padding(.top, 5)
                                
                                Text("Purchase at the Skeelo Store")
                                    .font(.caption)
                                    .fontWeight(.medium)
                                    .foregroundStyle(.red)
                                    .padding(.leading, 8)
                            }
                            
                            HStack {
                                Image(systemName: "book.pages")
                                    .font(.footnote)
                                    .foregroundStyle(SkeeloColor.darkGreen)
                                
                                Text("Ebook")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundStyle(SkeeloColor.darkGreen)
                                    .padding(.leading, 8)
                            }
                            
                            Spacer()
                        }
                        .padding(.leading, 10)
                    }
                    .padding(.leading, -15)
                    .padding(.bottom, 5)
                }
                .listRowSeparator(.hidden)
                .listRowBackground(Color.white)

            }
            .listStyle(.plain)
            .scrollIndicators(.hidden)
        }
        .padding(.leading, 15)
        .navigationBarBackButtonHidden()
        .ignoresSafeArea(edges: [.bottom, .trailing])
        .onAppear {
            viewModel.fecthCategory(id: category.id)
        }
        .background(.white)
    }
}

#Preview {
    ExploreDetailListView(category: PreviewData.category)
}