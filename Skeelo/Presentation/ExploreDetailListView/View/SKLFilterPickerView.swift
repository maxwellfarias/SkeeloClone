//
//  FilterPickerView.swift
//  Skeelo
//
//  Created by Maxwell Farias on 01/05/24.
//

import SwiftUI

struct SKLFilterPickerView: View {
    
    var tags: [String] = []
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false, content: {
            LazyHGrid(rows: [GridItem(.flexible(), spacing: 10)], alignment: .center, spacing: 10, content: {
                
                Image(systemName: "slider.horizontal.3")
                    .foregroundStyle(.gray)
                    .padding(.horizontal, 10)
                    .background(RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(SkeeloColor.lightGray, lineWidth: 1)
                        .frame(height: 45))
                
                ForEach(tags, id: \.self) { tag in
                    SKLMarkerButton(title: tag)
                }
            })
        })
        .frame(height: 50)
    }
}

#Preview {
    SKLFilterPickerView()
}
