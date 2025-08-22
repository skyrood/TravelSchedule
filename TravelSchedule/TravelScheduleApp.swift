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
            RootView()
                .environmentObject(orientationObserver)
                .environment(router)
                .environment(builder)
                .environment(viewModel)
                .environment(servicesFilters)
        }
    }
}
