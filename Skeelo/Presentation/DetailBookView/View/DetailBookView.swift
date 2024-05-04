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
    var book: BookModel
    let category: Category
    
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
                
                Button(action: {dismiss.callAsFunction()}) {
                    Image(systemName: "suit.heart.fill")
                        .font(.title3)
                        .frame(width: 23, height: 23)
                        .foregroundStyle(SkeeloColor.darkGray)
                }
            }
            .padding(.horizontal, 20)
            
            ScrollView {
                VStack(spacing: 0) {
                    
                    VStack(spacing: 0) {
                        KFImage(book.cover_i?.toURL())
                            .placeholder {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle())
                            }
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 180, height: 260)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(.top, 30)
                        
                        Text(book.title)
                            .font(.body)
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                            .padding(.top, 20)
                        
                        Text(book.title)
                            .font(.caption)
                            .fontWeight(.light)
                            .foregroundStyle(.gray)
                            .padding(.top, 10)
                    }
                    .padding(.horizontal, 20)
                    
                    VStack(spacing: 0) {
                        Divider()
                            .padding(.bottom, 10)
                        
                        HorizontalDetailView(ratingsCount: book.ratings_count ?? 0,
                                             ratingsAverage: book.ratings_average ?? 0,
                                             numberOfPagesMedian: book.number_of_pages_median ?? 0,
                                             publisher: book.publisher?[0] ?? ""
                        )
                        Divider()
                    }
                    .padding(.top, 25)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text(book.getString(datas: book.first_sentence))
                            .foregroundStyle(.gray)
                            .fontWeight(.light)
                            .font(.subheadline)
                        
                        Text("Moro info")
                            .foregroundStyle(.gray)
                            .fontWeight(.semibold)
                            .font(.subheadline)
                            .padding(.top, 20)
                        
                        if let language = book.language {
                            Text("Language: \(book.getString(datas: language))")
                                .foregroundStyle(.gray)
                                .fontWeight(.light)
                                .font(.subheadline)
                                .padding(.top, 20)
                        }
                        
                        if let year = book.first_publish_year {
                            Text("Year: \(String(year))")
                                .foregroundStyle(.gray)
                                .fontWeight(.light)
                                .font(.subheadline)
                                .padding(.top, 20)
                        }
                        
                        if let ISBN = book.isbn {
                            Text("ISBN: \(ISBN[0])")
                                .foregroundStyle(.gray)
                                .fontWeight(.light)
                                .font(.subheadline)
                                .padding(.top, 20)
                        }
                        
                        if let edition = book.edition_count {
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
                            .padding(.top, 20)
                            .padding(.bottom, 25)
                            
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 25)
                }
                
            }
        }
        .padding(.top, 6)
        .ignoresSafeArea(edges: [.bottom, .trailing, .leading])
        .background(.white)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    DetailBookView(book: PreviewData.detailBook, category: PreviewData.category)
}
