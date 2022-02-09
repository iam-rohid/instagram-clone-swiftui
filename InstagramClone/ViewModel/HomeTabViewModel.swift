//
//  HomeTabViewModel.swift
//  InstagramClone
//
//  Created by Rohidul Islam on 22/1/22.
//

import Foundation

final class HomeTabViewModel: ObservableObject {
    @Published var activeTab = 0
    @Published var isFeedTabLoaded = false
    @Published var isExploreTabLoaded = false
    @Published var isCreatePostTabLoaded = false
    @Published var isMarketPlaceTabLoaded = false
    @Published var isProfileTabLoaded = false
    
    func changeTab(index: Int){
        switch index {
        case 0:
            isFeedTabLoaded = true
        case 1:
            isExploreTabLoaded = true
        case 2:
            isCreatePostTabLoaded = true
        case 3:
            isMarketPlaceTabLoaded = true
        case 4:
            isProfileTabLoaded = true
        default:
            isFeedTabLoaded = true
        }
        self.activeTab = index
    }
}
