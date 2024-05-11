//
//  ReviewView.swift
//  Skeelo
//
//  Created by Maxwell Farias on 04/05/24.
//

import SwiftUI

struct ReviewView: View {
    var body: some View {
        VStack(spacing: 0) {
         
            GeometryReader { geo in
                ScrollView(.horizontal, showsIndicators: false, content: {
                    LazyHGrid(rows: [GridItem(.flexible(), spacing: 10)], alignment: .center, spacing: 10, content: {
                        
                        
                        ForEach(PreviewData.reviews, id:\.description) {review in
                            VStack(spacing: 0) {
                                VStack(alignment: .leading, spacing: 0) {
                                    Text(review.name)
                                        .foregroundStyle(.black)
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                    
                                    HStack(spacing: 3) {
                                        ForEach(1...review.rating, id:\.self) { review in
                                            Image(systemName: "star.fill")
                                                .font(.footnote)
                                                .fontWeight(.semibold)
                                                .foregroundStyle(SkeeloColor.orange)
                                        }
                                    }
                                    .padding(.top, 3)
                                    
                                    Text(review.description)
                                        .foregroundStyle(.gray)
                                        .font(.subheadline)
                                        .fontWeight(.light)
                                        .padding(.top, 20)
                                    
                                    
                                    
                                }
                                .padding([.leading, .top], 20)
                                Spacer()
                            }
                            .frame(width: geo.size.width * 0.9, alignment: .leading)
                            .background{
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.white)
                                    .frame(height: 145)
                                    .shadow(color: SkeeloColor.lightGray100, radius: 2, x: 1, y: 1)
                            }
                            .padding(.leading, 2)
                        }
                    })
                })
                
            }
            .frame(height: 150)
            
            Button {} label: {
                HStack {
                    Image(systemName: "star")
                        .font(.title3)
                        .foregroundStyle(SkeeloColor.darkGreen)
                    
                    Text("Review")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .foregroundStyle(SkeeloColor.darkGreen)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background{
                    Capsule()
                        .fill(.white)
                        .stroke(SkeeloColor.darkGray, lineWidth: 1)
                }
                .padding(.trailing, 20)
            }
            .padding(.top, 15)
            
            
            Spacer()
        }
        .frame(height: 250)
        .background(.white)
    }
}

#Preview {
    ReviewView()
}
