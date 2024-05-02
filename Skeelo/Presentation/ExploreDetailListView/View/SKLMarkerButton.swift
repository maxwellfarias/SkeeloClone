//
//  SKLMarkerButton.swift
//  Skeelo
//
//  Created by Maxwell Farias on 01/05/24.
//

import SwiftUI

struct SKLMarkerButton: View {
    
    @State var isActive: Bool = false
    var title: String
    
    var body: some View {
        Button(action: {isActive.toggle()}, label: {
            Text (title)
                .foregroundStyle(isActive ? SkeeloColor.green : .gray)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(isActive ? SkeeloColor.lightGreen : .white)
                    .stroke(isActive ? SkeeloColor.lightGreen :SkeeloColor.lightGray, lineWidth: 1)
                    .frame(height: 45))
        })
    }
}

#Preview {
    SKLMarkerButton(title: "My Books")
}
