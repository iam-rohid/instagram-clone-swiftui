//
//  HomeTabView.swift
//  InstagramClone
//
//  Created by Rohidul Islam on 20/1/22.
//

import SwiftUI

struct HomeTabView: View {
    @StateObject var homeTabVM = HomeTabViewModel()
    
    var body: some View {
        VStack (spacing: 0) {
            ZStack{
                Color.clear
                if homeTabVM.isFeedTabLoaded {
                    NavigationView{
                        FeedView()
                    }.opacity(homeTabVM.activeTab == 0 ? 1 : 0)
                }
                if homeTabVM.isExploreTabLoaded {
                    ExploreView()
                        .opacity(homeTabVM.activeTab == 1 ? 1 : 0)
                }
                if homeTabVM.isCreatePostTabLoaded {
                    CreatePostVIew()
                        .opacity(homeTabVM.activeTab == 2 ? 1 : 0)
                }
                if homeTabVM.isMarketPlaceTabLoaded {
                    MarketplaceView()
                        .opacity(homeTabVM.activeTab == 3 ? 1 : 0)
                }
                if homeTabVM.isProfileTabLoaded{
                    ProfileView()
                        .opacity(homeTabVM.activeTab == 4 ? 1 : 0)
                }
            }
            HStack(spacing: 0){
                TabItem(systemName:  homeTabVM.activeTab == 0 ? "house.fill" : "house", isActive: homeTabVM.activeTab == 0) {
                    homeTabVM.changeTab(index: 0)
                }
                TabItem(systemName: "magnifyingglass", isActive: homeTabVM.activeTab == 1) {
                    homeTabVM.changeTab(index: 1)
                }
                TabItem(systemName: homeTabVM.activeTab == 2 ?  "plus.app.fill" : "plus.app", isActive: homeTabVM.activeTab == 2) {
                    homeTabVM.changeTab(index: 2)
                }
                TabItem(systemName: homeTabVM.activeTab == 3 ? "bag.fill" : "bag", isActive: homeTabVM.activeTab == 3) {
                    homeTabVM.changeTab(index: 3)
                }
                TabItem(systemName: homeTabVM.activeTab == 4 ? "person.fill" : "person", isActive: homeTabVM.activeTab == 4) {
                    homeTabVM.changeTab(index: 4)
                }
            }
            .frame(height: 48)
            .background(Color(uiColor: .systemBackground))
        }.onAppear {
            homeTabVM.changeTab(index: 0)
        }.environmentObject(homeTabVM)
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}

struct TabItem: View {
    let systemName: String
    let isActive: Bool
    let action: () -> Void
    
    var body: some View {
        Button (
            action: action,
            label: {
                Image(systemName: systemName)
                    .font(.system(size: 24).weight(isActive ? .bold : .regular))
                    .foregroundColor(Color(uiColor: .label))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        )
    }
}
