//
//  DetailBookView.swift
//  Skeelo
//
//  Created by Maxwell Farias on 03/05/24.
//

import SwiftUI
import Kingfisher

struct DetailBookView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var favoriteIsSelected: Bool = false
    @StateObject var viewModel: DetailBookViewModel
    
    init(viewModel: DetailBookViewModel = DetailBookViewModel(fetchBookUseCase: UseCaseFactory.createFetchBooksUseCase()), category: Category, id: String) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.category = category
        self.id = id
    }
    let category: Category
    let id: String
    
    var body: some View {
        VStack(spacing: 0) {
            
            HStack(spacing: 0) {
                Button(action: {dismiss.callAsFunction()}) {
                    Image(systemName: "chevron.backward")
                        .font(.title3)
                        .foregroundStyle(.black)
                }
                
                Spacer()
                
                Button(action: {}) {
                    Image("share")
                        .resizable()
                        .frame(width: 23, height: 23)
                        .foregroundStyle(.black)
                }
                .padding(.trailing, 30)
                
                Button(action: {
                    favoriteIsSelected.toggle()
                    if favoriteIsSelected {
                        viewModel.errorToast = Toast(type: .success, title: "Congratulations!", message: "You have a new book on your favorites list! 📚")
                    } else {
                        viewModel.errorToast = Toast(type: .info, title: "Information", message: "The book \(viewModel.book?.title ?? "") has been removed from your favorites list")
                    }
                }) {
                    Image(systemName: "suit.heart.fill")
                        .font(.title3)
                        .frame(width: 23, height: 23)
                        .foregroundStyle(favoriteIsSelected ? .red : SkeeloColor.darkGray)
                }
            }
            .padding(.horizontal, 20)
            
            if viewModel.isLoading {
                
                DetailBookLoadingView()
                
            } else {
                
                ZStack(alignment: .bottom) {
                    ScrollView {
                        VStack(spacing: 0) {
                            
                            VStack(spacing: 0) {
                                KFImage(viewModel.book?.cover_i?.toURL())
                                    .placeholder {
                                        ProgressView()
                                            .progressViewStyle(CircularProgressViewStyle())
                                    }
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 180, height: 260)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .padding(.top, 30)
                                
                                Text(viewModel.book?.title ?? "")
                                    .font(.body)
                                    .foregroundStyle(.black)
                                    .fontWeight(.semibold)
                                    .padding(.top, 20)
                                
                                Text(viewModel.book?.title ?? "")
                                    .font(.caption)
                                    .fontWeight(.light)
                                    .foregroundStyle(.gray)
                                    .padding(.top, 10)
                            }
                            .padding(.horizontal, 20)
                            
                            VStack(spacing: 0) {
                                Divider()
                                    .padding(.bottom, 10)
                                
                                HorizontalDetailView(ratingsCount: viewModel.book?.ratings_count ?? 0,
                                                     ratingsAverage: viewModel.book?.ratings_average ?? 0,
                                                     numberOfPagesMedian: viewModel.book?.number_of_pages_median ?? 0,
                                                     publisher: viewModel.book?.publisher?[0] ?? ""
                                )
                                Divider()
                            }
                            .padding(.top, 25)
                            
                            VStack(alignment: .leading, spacing: 0) {
                                Text(viewModel.book?.getString(datas: viewModel.book?.first_sentence) ?? "")
                                    .foregroundStyle(.gray)
                                    .fontWeight(.light)
                                    .font(.subheadline)
                                
                                Text("More info")
                                    .foregroundStyle(.gray)
                                    .fontWeight(.semibold)
                                    .font(.subheadline)
                                    .padding(.top, 20)
                                
                                if let languages = viewModel.book?.language {
                                    Text("Language: \(viewModel.book?.getString(datas: languages) ?? "")")
                                        .foregroundStyle(.gray)
                                        .fontWeight(.light)
                                        .font(.subheadline)
                                        .padding(.top, 20)
                                }
                                
                                if let year = viewModel.book?.first_publish_year {
                                    Text("Year: \(String(year))")
                                        .foregroundStyle(.gray)
                                        .fontWeight(.light)
                                        .font(.subheadline)
                                        .padding(.top, 20)
                                }
                                
                                if let ISBN = viewModel.book?.isbn {
                                    Text("ISBN: \(ISBN[0])")
                                        .foregroundStyle(.gray)
                                        .fontWeight(.light)
                                        .font(.subheadline)
                                        .padding(.top, 20)
                                }
                                
                                if let edition = viewModel.book?.edition_count {
                                    Text("Edition: \(String(edition))")
                                        .foregroundStyle(.gray)
                                        .fontWeight(.light)
                                        .font(.subheadline)
                                        .padding(.top, 20)
                                }
                                
                                Text("\(category.name)")
                                    .foregroundStyle(SkeeloColor.darkGreen)
                                    .fontWeight(.light)
                                    .font(.subheadline)
                                    .padding(.horizontal, 20)
                                    .background(RoundedRectangle(cornerRadius: 10, style: .continuous)
                                        .fill(SkeeloColor.lightGreen)
                                        .stroke(SkeeloColor.lightGreen, lineWidth: 1)
                                        .frame(height: 40))
                                    .padding(.vertical, 30)
                                
                                HStack {
                                    Text("Reviews")
                                        .foregroundStyle(.black)
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                    
                                    Spacer()
                                    
                                    Button(action: {}) {
                                        Text("Read more")
                                            .foregroundStyle(SkeeloColor.darkGreen)
                                            .font(.subheadline)
                                            .fontWeight(.semibold)
                                    }
                                }
                                .padding(.bottom, 20)
                                
                            }
                            .padding(.horizontal, 20)
                            .padding(.top, 25)
                            
                            ReviewView()
                                .padding(.leading, 20)
                                .padding(.bottom, 60)
                        }
                    }
                    
                    HStack(spacing: 15) {
                        Button { } label: {
                            Text("I want it!")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .foregroundStyle(.white)
                                .background{
                                    Capsule()
                                        .fill(SkeeloColor.darkGreen)
                                }
                        }
                        
                        Button { } label: {
                            HStack(spacing: 8) {
                                Spacer()
                                Image(systemName: "eyeglasses")
                                    .foregroundStyle(SkeeloColor.darkGreen)
                                    .font(.title2)
                                
                                Text("Sample")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .foregroundStyle(SkeeloColor.darkGreen)
                                
                                Spacer()
                            }
                            .frame(height:50)
                            .background{
                                Capsule()
                                    .fill(.white)
                                    .stroke(SkeeloColor.darkGreen, lineWidth: 1)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 30)
                    
                }
                .padding(.top, 15)
            }
        }
        .padding(.top, 6)
        .ignoresSafeArea(edges: [.bottom, .trailing, .leading])
        .background(.white)
        .navigationBarBackButtonHidden()
        .onAppear{
            viewModel.fetchBook(id: id)
        }
        .toastView(toast: $viewModel.errorToast)
    }
}

#Preview {
    DetailBookView(category: PreviewData.category, id: PreviewData.category.name)
}
