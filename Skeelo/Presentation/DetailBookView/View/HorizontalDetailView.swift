//
//  HorizontalDetailView.swift
//  Skeelo
//
//  Created by Maxwell Farias on 03/05/24.
//

import SwiftUI

struct HorizontalDetailView: View {
    
    let ratingsCount: Int
    let ratingsAverage: Float
    let numberOfPagesMedian: Int
    let publisher: String
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(alignment: .top, spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    Text("\(String(ratingsCount)) reviews")
                        .font(.caption2)
                        .fontWeight(.light)
                        .foregroundStyle(.gray)
                    
                    HStack {
                        Image(systemName: "star.fill")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundStyle(SkeeloColor.orange)
                        
                        Text(String(round(ratingsAverage)))
                            .font(.footnote)
                            .foregroundStyle(.black)
                        
                        Image(systemName: "chevron.right")
                            .font(.caption2)
                            .foregroundStyle(.black)
                    }
                    .padding(.top, 10)
                }
                .padding(.leading, 25)
                .padding(.trailing, 20)
                
                Divider()
                    .frame(height: 50)
                
                VStack(alignment: .center, spacing: 0) {
                    Text("Delivered by")
                        .font(.caption2)
                        .fontWeight(.light)
                        .foregroundStyle(.gray)
                    
                    Image(systemName: "apple.logo")
                        .font(.title3)
                        .foregroundStyle(.black)
                        .padding(.top, 10)
                    
                    Spacer()
                }
                .padding(.horizontal, 15)
                
                Divider()
                    .frame(height: 50)
                
                VStack(alignment: .center, spacing: 0) {
                    Text("Pages")
                        .font(.caption2)
                        .fontWeight(.light)
                        .foregroundStyle(.gray)
                    
                    Text(String(numberOfPagesMedian))
                        .font(.caption2)
                        .fontWeight(.medium)
                        .foregroundStyle(.black)
                        .padding(.top, 10)
                    
                    Spacer()
                }
                .padding(.horizontal, 10)
                
                Divider()
                    .frame(height: 50)
                
                VStack(alignment: .center, spacing: 0) {
                    Text("Publishing company")
                        .font(.caption2)
                        .fontWeight(.light)
                        .foregroundStyle(.gray)
                    
                    Text(String(publisher))
                        .font(.caption2)
                        .fontWeight(.medium)
                        .foregroundStyle(.black)
                        .padding(.top, 10)
                    
                    Spacer()
                }
                .padding(.horizontal, 10)
                
                Divider()
                    .frame(height: 50)
                
                VStack(alignment: .center, spacing: 0) {
                    Text("File size")
                        .font(.caption2)
                        .fontWeight(.light)
                        .foregroundStyle(.gray)
                    
                    Text("820 KB")
                        .font(.caption2)
                        .fontWeight(.medium)
                        .foregroundStyle(.black)
                        .padding(.top, 10)
                    
                    Spacer()
                }
                .padding(.horizontal, 10)
            }
        }
        .scrollIndicators(.hidden)
        .frame(height: 63)
    }
}

#Preview {
    HorizontalDetailView(
        ratingsCount: PreviewData.detailBook.ratings_count ?? 0,
        ratingsAverage: PreviewData.detailBook.ratings_average ?? 0,
        numberOfPagesMedian: PreviewData.detailBook.number_of_pages_median ?? 0,
        publisher: PreviewData.detailBook.publisher?[0] ?? "")
}
