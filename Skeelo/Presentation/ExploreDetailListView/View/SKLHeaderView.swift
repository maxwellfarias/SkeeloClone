//
//  SKLHeaderView.swift
//  Skeelo
//
//  Created by Maxwell Farias on 01/05/24.
//

import SwiftUI

struct SKLHeaderView: View {
    
    @Environment(\.dismiss) var dismiss
    var title: String
    
    var body: some View {
        HStack {
            Button(action: {dismiss.callAsFunction()}) {
                Image(systemName: "chevron.backward")
                    .font(.title3)
                    .foregroundStyle(.black)
            }
            
            Spacer()
            Text(title)
                .foregroundStyle(.black)
                .font(.subheadline)
                .fontWeight(.semibold)
            Spacer()
        }
    }
}

#Preview {
    SKLHeaderView(title: PreviewData.category.name)
}
