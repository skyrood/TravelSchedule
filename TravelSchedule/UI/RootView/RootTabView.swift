//
//  RootTabView.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/18.
//

import SwiftUI

struct RootTabView: View {
    @Environment(Router.self) private var router
    
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
            MainScreenView()
                .tabItem { Image(.scheduleTabIcon).renderingMode(.template) }
            
            SettingsView()
                .tabItem { Image(.settingsTabIcon).renderingMode(.template) }
        }
        .tint(.ypBlack)
    }
}

#Preview {
    RootTabView()
        .environmentObject(OrientationObserver())
        .environment(Router())
        .environment(TripBuilder())
}
