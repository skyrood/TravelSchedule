//
//  Router.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/20.
//

import SwiftUI

@Observable
final class Router {
    var selectedTab: AppTabRoute = .schedule
    
    var schedulePath = NavigationPath()
    var settingsPath = NavigationPath()
    
    func pathBinding(for tab: AppTabRoute) -> Binding<NavigationPath> {
        Binding(
            get: { [unowned self] in
                switch tab {
                case .schedule: return self.schedulePath
                case .settings: return self.settingsPath
                }
            },
            set: { [unowned self] newValue in
                switch tab {
                case .schedule: self.schedulePath = newValue
                case .settings: self.settingsPath = newValue
                }
            }
        )
    }
    
    func go(to route: Route) {
        schedulePath.append(route)
    }
    
    func go(to route: SettingsRoute) {
        settingsPath.append(route)
    }
    
    func go(to tab: AppTabRoute, route: Route) {
        selectedTab = tab
        DispatchQueue.main.async { self.schedulePath.append(route) }
    }
    
    func go(to tab: AppTabRoute, route: SettingsRoute) {
        selectedTab = tab
        DispatchQueue.main.async { self.settingsPath.append(route) }
    }
    
    func pop(_ count: Int = 1) {
        switch selectedTab {
        case .schedule:
            for _ in 0..<count where !schedulePath.isEmpty { schedulePath.removeLast() }
        case .settings:
            for _ in 0..<count where !settingsPath.isEmpty { settingsPath.removeLast() }
        }
    }
    
    func popToRoot(_ tab: AppTabRoute? = nil) {
        switch tab ?? selectedTab {
        case .schedule: schedulePath = NavigationPath()
        case .settings: settingsPath = NavigationPath()
        }
    }
    
    func setPath(_ routes: [Route]) {
        schedulePath = NavigationPath()
        routes.forEach {
            schedulePath.append($0)
        }
    }
}
