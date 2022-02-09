//
//  HomeView.swift
//  InstagramClone
//
//  Created by Rohidul Islam on 21/1/22.
//

import SwiftUI

struct HomeView: View {
    @State var selectedIndex = 1
    var body: some View {
        TabView (selection: $selectedIndex) {
            HomeTabView()
                .tag(1)
        }.tabViewStyle(.page(indexDisplayMode: .never))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
