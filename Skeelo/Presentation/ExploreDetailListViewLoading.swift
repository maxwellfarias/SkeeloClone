//
//  ExploreDetailListViewLoading.swift
//  Skeelo
//
//  Created by Maxwell Farias on 13/05/24.
//

import SwiftUI

struct ExploreDetailListViewLoading: View {
    
    var body: some View {
        
        VStack(spacing: 0) {
                
            List(1..<6) { _ in
                
                HStack(alignment: .top) {
                                LoadingEffectView()
                                .cornerRadius(10)
                                .frame(width: 105, height: 150)
                                .padding(.top, 15)
                            
                            VStack(alignment: .leading, spacing: 0) {
                                LoadingEffectView()
                                    .cornerRadius(10)
                                    .frame(height: 25)
                                    .frame(maxWidth: .infinity)
                                
                                LoadingEffectView()
                                    .cornerRadius(10)
                                    .frame(height: 25)
                                    .frame(maxWidth: .infinity)
                                    .padding(.top, 8)
                                
                                HStack(alignment: .top) {
                                    LoadingEffectView()
                                        .cornerRadius(13)
                                        .frame(width: 26, height: 26)
                                    
                                    LoadingEffectView()
                                        .cornerRadius(10)
                                        .frame(width: 110, height: 25)
                                }
                                .padding(.top, 10)
                                
                                HStack(alignment: .top) {
                                    LoadingEffectView()
                                        .cornerRadius(13)
                                        .frame(width: 26, height: 26)
                                    
                                    LoadingEffectView()
                                        .cornerRadius(10)
                                        .frame(width: 110, height: 25)
                                }
                                .padding(.top, 10)
                                
                                Spacer()
                            }
                            .padding(.leading, 10)
                            .padding(.top, 20)
                        }
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.white)
                        .padding(.leading, -15)
                }
                .listStyle(.plain)
                .scrollIndicators(.hidden)
        }
        .padding(.leading, 15)
        .navigationBarBackButtonHidden()
        .ignoresSafeArea(edges: [.bottom, .trailing])
        .background(.white)
    }
}

#Preview {
    ExploreDetailListViewLoading()
}
