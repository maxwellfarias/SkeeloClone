//
//  DetailBookLoadingView.swift
//  Skeelo
//
//  Created by Maxwell Farias on 13/05/24.
//

import SwiftUI

struct DetailBookLoadingView: View {
    
    var body: some View {
        VStack(spacing: 0) {
            
            ZStack(alignment: .bottom) {
                ScrollView {
                    VStack(spacing: 0) {
                        
                        VStack(spacing: 0) {
                            SKLLoadingEffectView()
                                .cornerRadius(10)
                                .frame(width: 180, height: 260)
                                .padding(.top, 30)
                            
                            SKLLoadingEffectView()
                                .cornerRadius(10)
                                .frame(width: 180, height: 25)
                                .padding(.top, 20)
                            
                            SKLLoadingEffectView()
                                .cornerRadius(10)
                                .frame(width: 180, height: 20)
                                .padding(.top, 10)
                        }
                        .padding(.horizontal, 20)
                        
                        SKLLoadingEffectView()
                            .cornerRadius(10)
                            .frame(maxWidth: .infinity)
                            .frame(height: 75)
                            .padding(.top, 25)
                        
                        VStack(alignment: .leading, spacing: 0) {
                            SKLLoadingEffectView()
                                .cornerRadius(10)
                                .frame(maxWidth: .infinity)
                                .frame(height: 100)
                            
                            SKLLoadingEffectView()
                                .cornerRadius(10)
                                .frame(width: 75, height: 25)
                                .padding(.top, 20)       
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 25)
                    }
                }
                
                HStack(spacing: 15) {
                    Button { } label: {
                        Text("I want it!")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .foregroundStyle(.white)
                            .background{
                                Capsule()
                                    .fill(SkeeloColor.darkGreen)
                            }
                            .opacity(0.3)
                    }
                    
                    Button { } label: {
                        HStack(spacing: 8) {
                            Spacer()
                            Image(systemName: "eyeglasses")
                                .foregroundStyle(SkeeloColor.darkGreen)
                                .font(.title2)
                            
                            Text("Sample")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundStyle(SkeeloColor.darkGreen)
                            
                            Spacer()
                        }
                        .frame(height:50)
                        .background{
                            Capsule()
                                .fill(.white)
                                .stroke(SkeeloColor.darkGreen, lineWidth: 1)
                        }
                        .opacity(0.3)
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .padding(.horizontal, 20)
                .padding(.bottom, 30)
                
            }
            .padding(.top, 15)
        }
    }
}

#Preview {
    DetailBookLoadingView()
        .background(.white)
}
