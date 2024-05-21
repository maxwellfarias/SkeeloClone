//
//  SearchBarView.swift
//  Skeelo
//
//  Created by Maxwell Farias on 16/05/24.
//

import SwiftUI

struct SearchBarView: View {
    
    @State var typedText: String = ""
    @State var txtFieldIsFocused = false
    @FocusState var focusStateReader: Bool
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        HStack {
            HStack(spacing: 0) {
                
                TextField("", text: $typedText, prompt:
                            Text("What would you like to read?")
                    .font(.subheadline)
                    .fontWeight(.light)
                    .foregroundStyle(SkeeloColor.lightGray100)
                )
                .focused($focusStateReader)
                .foregroundStyle(.gray)
                .fontWeight(.light)
                .padding(.leading, 15)
                .onChange(of: focusStateReader) {_, new in
                    withAnimation {
                        txtFieldIsFocused = focusStateReader
                    }
                }
                
                Spacer(minLength: 18)
                
                if typedText != "" {
                    
                    Button {
                        withAnimation {
                            typedText = ""
                        }
                    } label: {
                        Image(systemName: "xmark.circle")
                            .foregroundStyle(.black)
                            .opacity(0.7)
                            .font(.title3)
                            .padding(.trailing, 25)
                    }
                }
                
                Button {
                    withAnimation(Animation.easeIn) {
                        /*
                         TODO: 1.1Adicionar a acao de busca
                         1.2 Validacao de no minimo 3 caracteres
                         
                         */
                        txtFieldIsFocused = true
                    }
                } label: {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.darkGreen)
                        .font(.title3)
                        .padding(.trailing, 15)
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 40)
            .background(RoundedRectangle(cornerRadius: 10, style: .continuous)
                .stroke(SkeeloColor.lightGray, lineWidth: 1))
            
            if txtFieldIsFocused {
                Button(action: {dismiss.callAsFunction()}) {
                    Text("Cancel")
                        .foregroundStyle(SkeeloColor.darkGreen)
                        .fontWeight(.semibold)
                        .font(.callout)
                        .padding(.leading, 15)
                }
            }
        }
    }
}

#Preview {
    SearchBarView()
        .background(.white)
}
