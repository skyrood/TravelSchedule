//
//  RootTabView.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/18.
//

import SwiftUI

struct RootTabView: View {
    @Environment(Router.self) private var router
    @State private var selectedTab = 0
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .ypWhite
        
        appearance.shadowColor = .ypGray
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedTab) {
                MainScreenView()
                    .tabItem { Image(.scheduleTabIcon).renderingMode(.template) }
                    .tag(0)
                
                NavigationStack(path: router.settingsPathBinding()) {
                    SettingsView()
                        .navigationDestination(for: SettingsRoute.self, destination: settingsDestination)
                }
                .tabItem { Image(.settingsTabIcon).renderingMode(.template) }
                .tag(1)
            }
            .tint(.ypBlack)
            
            NavigationStack(path: router.globalPathBinding()) {
                EmptyView()
                    .navigationDestination(for: GlobalRoute.self) { route in
                        globalDestination(route)
                    }
            }
            .opacity(router.globalPath.isEmpty ? 0 : 1)
        }
        .onChange(of: router.activeTab) { _, newValue in
            if let newValue { selectedTab = newValue }
        }
        .onChange(of: selectedTab) { _, newValue in
            if newValue == 0 {
                router.popToSettingsRoot()
            }
        }
    }
    
    @ViewBuilder
    private func globalDestination(_ route: GlobalRoute) -> some View {
        switch route {
        case .settlement(let kind):
            SettlementSelectionView(kind: kind)
        case .station(let settlement, let kind):
            StationSelectionView(settlement: settlement, kind: kind)
        case .serviceList:
            ServiceListView()
        case .filters:
            ServiceFiltersView()
        case .carrierInfo(let carrier):
            CarrierInfoView(carrier: carrier)
        case .stories(let index):
            StoriesView(startIndex: index)
        case .userAgreement:
            UserAgreementView()
        }
    }
    
    @ViewBuilder
    private func settingsDestination(_ route: SettingsRoute) -> some View {
        switch route {
        case .connectionError:
            ConnectionErrorView()
        case .serverError:
            ServerErrorView()
        }
    }
}

#Preview {
    RootTabView()
        .environmentObject(OrientationObserver())
        .environment(Router())
        .environment(TripBuilder())
}
