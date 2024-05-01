//
//  ExploreView.swift
//  Skeelo
//
//  Created by Maxwell Farias on 01/05/24.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        VStack(spacing: 0) {
            
            Text("Explore")
                .font(.title3)
                .fontWeight(.bold)
            
            ZStack(alignment: .trailing) {
                
                NavigationLink {
                    Text("Another View")
                } label: {
                    Text ("What would you like to read?")
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
                        .font(.title2)
                        .padding(.trailing, 15)
                }
            }
            .frame(maxWidth: .infinity)
            
            
            
            Spacer()
        }
        .padding(.horizontal, 15)
        .padding(.top, 40)
        
    }
}

#Preview {
    NavigationStack {
        ExploreView()
    }
}
