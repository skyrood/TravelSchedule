//
//  Router.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/20.
//

import SwiftUI

@MainActor
@Observable
final class Router {
    enum activeTab {
        case main
        case settings
    }
    
    var globalPath = NavigationPath()
    var settingsPath = NavigationPath()
    var tab: activeTab?
    
    func globalPathBinding() -> Binding<NavigationPath> {
        Binding(
            get: { self.globalPath },
            set: { self.globalPath = $0 }
        )
    }
    
    func settingsPathBinding() -> Binding<NavigationPath> {
        Binding(
            get: { self.settingsPath },
            set: { self.settingsPath = $0 }
        )
    }
    
    func go(to route: GlobalRoute) {
        globalPath.append(route)
    }

    func pop(_ count: Int = 1) {
        for _ in 0..<count where !globalPath.isEmpty {
            globalPath.removeLast()
        }
    }

    func popToRoot() {
        globalPath = NavigationPath()
    }

    func setPath(_ routes: [GlobalRoute]) {
        globalPath = NavigationPath()
        routes.forEach { globalPath.append($0) }
    }
    
    func go(to route: SettingsRoute) {
        tab = .settings
        settingsPath.append(route)
    }

    func popSettings(_ count: Int = 1) {
        for _ in 0..<count where !settingsPath.isEmpty {
            settingsPath.removeLast()
        }
    }

    func popToSettingsRoot() {
        settingsPath = NavigationPath()
    }

    func setPath(_ routes: [SettingsRoute]) {
        settingsPath = NavigationPath()
        routes.forEach { settingsPath.append($0) }
    }
}
