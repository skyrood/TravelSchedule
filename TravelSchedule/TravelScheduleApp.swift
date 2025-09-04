//
//  TravelScheduleApp.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/07/26.
//

import SwiftUI

@main
struct TravelScheduleApp: App {
    @StateObject private var orientationObserver = OrientationObserver()
    
    @State private var router = Router()
    @State private var builder = TripBuilder()
    @State private var viewModel = SettlementViewModel()
    @State private var servicesFilters = ServicesFiltersViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: router.pathBinding()) {
                RootView()
                    .navigationDestination(for: Route.self, destination: destination)
            }
            .environmentObject(orientationObserver)
            .environment(router)
            .environment(builder)
            .environment(viewModel)
            .environment(servicesFilters)
        }
    }
    
    @ViewBuilder
    private func destination(_ route: Route) -> some View {
        switch route {
        case .settlement(let kind):
            SettlementSelectionView(kind: kind)
        case .station(let settlement, let kind):
            StationSelectionView(settlement: settlement, kind: kind)
        case .serviceList:
            ServiceListView()
        case .filters:
            ServiceFiltersView()
        case .carrierInfo:
            CarrierInfoView()
        }
    }
}
