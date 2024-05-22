//
//  Home.swift
//  Skeelo
//
//  Created by Maxwell Farias on 20/05/24.
//

import SwiftUI

struct Home: View {
    
    @State private var activeTab: Tab = .home
    @Namespace private var animation
    @State private var tabShapePosition: CGPoint = .zero
    
    var body: some View {
        
        NavigationStack {
            ZStack(alignment: .bottom) {
                
                TabView(selection: $activeTab){
                    Text("Home")
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(.white)
                        .tag(Tab.home)
                        .toolbar(.hidden, for: .tabBar)
                    
                    Text("Bookshelf")
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(.white)
                        .tag(Tab.bookshelf)
                        .toolbar(.hidden, for: .tabBar)
                    
                    ExploreView()
                        .tag(Tab.explore)
                        .toolbar(.hidden, for: .tabBar)
                    
                    Text("Profile")
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(.white)
                        .tag(Tab.profile)
                        .toolbar(.hidden, for: .tabBar)
                }
                
                CustomTabBar()
            }
            .ignoresSafeArea(.keyboard)
        }
    }
    
    @ViewBuilder
    func CustomTabBar(_ tint: Color = SkeeloColor.darkGreen, inactiveTint: Color = SkeeloColor.mainGreen) -> some View {
        
        HStack(alignment: .bottom, spacing: 0) {
            ForEach(Tab.allCases, id: \.rawValue) {
                TabItem(
                    tint: tint,
                    inactiveTint: inactiveTint,
                    tab: $0,
                    animation: animation,
                    activeTab: $activeTab,
                    position: $tabShapePosition
                )
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
        .background {
            TabShape(midpoint: tabShapePosition.x)
                .fill(.white)
                .ignoresSafeArea()
                .shadow(color: tint.opacity(0.2), radius: 5, x: 0, y: -5)
                .padding(.top, 30)
        }
        .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7), value: activeTab)
    }
}

struct TabItem: View {
    var tint: Color
    var inactiveTint: Color
    var tab: Tab
    var animation: Namespace.ID
    @Binding var activeTab: Tab
    @Binding var position: CGPoint
    @State private var tabPosition: CGPoint = .zero
    
    var body: some View {
        VStack(spacing: 0) {
            
            Image(systemName: tab.systemImage)
                .font(.title2)
                .frame(width: activeTab == tab ? 58 : 35, height: activeTab == tab ? 58 : 35)
                .foregroundStyle(activeTab == tab ? .white : inactiveTint)
                .background {
                    if activeTab == tab {
                        Circle()
                            .fill(tint.gradient)
                            .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                    }
                }
            
            Text(tab.rawValue)
                .font(.caption)
                .foregroundStyle(activeTab == tab ? tint : .gray)
        }
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
        .viewPosition(completion: { rect in
            tabPosition.x = rect.midX
            //            Updating Active Tab Position
            if activeTab == tab {
                position.x = rect.midX
            }
        })
        .onTapGesture {
            activeTab = tab
            
            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                position.x = tabPosition.x
            }
        }
    }
}

#Preview {
    Home()
}
