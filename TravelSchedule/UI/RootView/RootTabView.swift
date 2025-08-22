//
//  RootTabView.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/18.
//

import SwiftUI

struct RootTabView: View {
    @State private var router = Router()
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .ypWhite
        
        appearance.shadowColor = .ypGray
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        TabView(selection: $router.selectedTab) {
            
            NavigationStack(path: router.pathBinding(for: .schedule)) {
                MainScreenView()
                    .navigationDestination(for: Route.self) { route in
                        switch route {
                        case .settlement(let kind):
                            SettlementSelectionView(kind: kind)
                        case .station(let s, let kind):
                            StationSelectionView(settlement: s, kind: kind)
                        case .serviceList:
                            ServiceListView()
                        case .filters:
                            ServiceFiltersView()
                        case .carrierInfo:
                            CarrierInfoView()
                        }
                    }
            }
            .tabItem { Image(.scheduleTabIcon).renderingMode(.template) }
            .tag(AppTabRoute.schedule)
            
            NavigationStack(path: router.pathBinding(for: .settings)) {
                SettingsView()
                    .navigationDestination(for: SettingsRoute.self) { route in
                        switch route {
                        case .connectionError: ConnectionErrorView()
                        case .serverError: ServerErrorView()
                        }
                    }
            }
            .tabItem { Image(.settingsTabIcon).renderingMode(.template) }
            .tag(AppTabRoute.settings)
        }
        .tint(.ypBlack)
        .environment(router)
    }
}

#Preview {
    RootTabView()
        .environmentObject(OrientationObserver())
        .environment(Router())
        .environment(TripBuilder())
}
