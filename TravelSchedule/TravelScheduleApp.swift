//
//  TravelScheduleApp.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/07/26.
//

import SwiftUI

@main
struct TravelScheduleApp: App {
    @State private var router = Router()
    @State private var builder = TripBuilder()
    @State private var viewModel = SettlementViewModel()
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
            NavigationStack(path: $router.path) {
                RootView()
                .navigationDestination(for: Route.self, destination: destination)
            }
            .environment(router)
            .environment(builder)
            .environment(viewModel)
        }
    }
    
    @ViewBuilder
    private func destination(_ route: Route) -> some View {
        switch route {
        case .settlement(let kind):
            SettlementSelectionView(kind: kind)
        case .station(let settlement, let kind):
            StationSelectionView(settlement: settlement, kind: kind)
        }
    }
}
