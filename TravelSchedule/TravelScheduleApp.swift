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
    @StateObject private var colorSchemeManager = ColorSchemeManager()
    
    @State private var router = Router()
    @State private var builder = TripBuilder()
    @State private var viewModel = SettlementViewModel()
    @State private var servicesFilters = ServicesFilters()
    @State private var storiesViewModel = StoriesViewModel()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(orientationObserver)
                .environmentObject(colorSchemeManager)
                .environment(router)
                .environment(builder)
                .environment(viewModel)
                .environment(servicesFilters)
                .environment(storiesViewModel)
                .preferredColorScheme(colorSchemeManager.currentColorScheme)
                .task {
                    await viewModel.loadSettlements()
                }
                .onChange(of: viewModel.state) { _, newValue in
                    switch newValue {
                    case .failure(.network):
                        router.popToRoot()
                        router.go(to: SettingsRoute.connectionError)
                    case .failure(.server):
                        router.popToRoot()
                        router.go(to: SettingsRoute.serverError)
                    default:
                        break
                    }
                }
        }
    }
}
