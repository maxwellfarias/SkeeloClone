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
    
    var body: some View {
        ScrollView {
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
                        .fontWeight(.semibold)
                        .padding(.top, 20)
                    
                    Text(book.title)
                        .font(.caption)
                        .fontWeight(.light)
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
                
            }
        }
        .padding(.top, 6)
        .ignoresSafeArea(edges: [.bottom, .trailing, .leading])
    }
}

#Preview {
    DetailBookView(book: PreviewData.detailBook)
}
