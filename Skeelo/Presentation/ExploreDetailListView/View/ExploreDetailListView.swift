//
//  ExploreDetailListView.swift
//  Skeelo
//
//  Created by Maxwell Farias on 01/05/24.
//

import SwiftUI
import Kingfisher

struct ExploreDetailListView: View {
    
    @StateObject var viewModel: ExploreDetailListViewModel
    var category: Category
    
    init(viewModel: ExploreDetailListViewModel = ExploreDetailListViewModel(), category: Category) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.category = category
    }
    
    var body: some View {
        
        VStack {
            
            SKLHeaderView(title: category.name)
                .padding(.leading, 10)
            
            SKLFilterPickerView(tags: ["My Books", "Available for exchange", "Skeelo Store"])
                .padding([.top, .leading], 10)
            
            if viewModel.isLoading {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .controlSize(.large)
                    .progressViewStyle(CircularProgressViewStyle(tint: .gray))
            } else {
                
                List(viewModel.books, id:\.key) { book in
                    NavigationLink {DetailBookView(category: category, id: book.title ?? "")} label: {
                        HStack {
                            KFImage(book.cover_id?.toURL())
                                .placeholder {
                                    ProgressView()
                                        .progressViewStyle(CircularProgressViewStyle())
                                }
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 105, height: 150)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            VStack(alignment: .leading, spacing: 10) {
                                Text(book.title ?? "")
                                    .foregroundStyle(.black)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .padding(.top, 10)
                                
                                Text(book.getAllAuthors())
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
        }
        .padding(.leading, 15)
        .navigationBarBackButtonHidden()
        .ignoresSafeArea(edges: [.bottom, .trailing])
        .onAppear {
            viewModel.fecthCategory(id: category.id)
        }
        .background(.white)
        .toastView(toast: $viewModel.errorToast)
    }
}

#Preview {
    NavigationStack {
        ExploreDetailListView(category: PreviewData.category)
    }
}
