//
//  TabView.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/18.
//

import SwiftUI

struct MainScreenTabView: View {
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .ypWhite

        appearance.shadowColor = .ypGray

        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        TabView {
            ZStack {
                MainScreenView()
            }
            .tabItem {
                Image(.scheduleTabIcon)
                    .renderingMode(.template)
            }

            ZStack {
                Color.ypBlue.edgesIgnoringSafeArea(.top)
                Text("Синяя вкладка")
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
            .tabItem {
                Image(.settingsTabIcon)
                    .renderingMode(.template)
            }
        }
        .tint(.ypBlack)
    }
}

#Preview {
    MainScreenTabView()
}
