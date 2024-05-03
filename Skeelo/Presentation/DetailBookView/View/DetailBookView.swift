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
                    
                    
//                    Text(book.title)
//                        .foregroundStyle(.black)
//                        .font(.subheadline)
//                        .fontWeight(.semibold)
                    
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
                
                Text("Access the Skeelo Store on the Internet to buy this book.")
                    .font(.caption)
                    .foregroundStyle(SkeeloColor.blue)
                    .fontWeight(.semibold)
                    .padding(.top, 15)
                
                Text("The book you acquired are available to read here.")
                    .font(.caption)
                    .foregroundStyle(SkeeloColor.darkBlue)
                    .fontWeight(.light)
                    .padding(.top, 10)
                
                HStack {
                    
                }
                .padding(.top, 25)

                
            }
        }
        .padding(.horizontal, 25)
    }
}

#Preview {
    DetailBookView(book: PreviewData.detailBook)
}
