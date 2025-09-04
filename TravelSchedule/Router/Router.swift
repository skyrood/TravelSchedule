//
//  Router.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/20.
//

import SwiftUI

@Observable
final class Router {
    var schedulePath = NavigationPath()
    var settingsPath = NavigationPath()
    
    func pathBinding() -> Binding<NavigationPath> {
        Binding(
            get: { self.schedulePath },
            set: { self.schedulePath = $0 }
        )
    }
    
    func settingsPathBinding() -> Binding<NavigationPath> {
        Binding(
            get: { self.settingsPath },
            set: { self.settingsPath = $0 }
        )
    }
    
    func go(to route: Route) {
        schedulePath.append(route)
    }
    
    func pop(_ count: Int = 1) {
        for _ in 0..<count where !schedulePath.isEmpty { schedulePath.removeLast() }
    }
    
    func popToRoot() {
        schedulePath = NavigationPath()
    }
    
    func go(to route: SettingsRoute) {
        settingsPath.append(route)
    }
    
    func popSettings(_ count: Int = 1) {
        for _ in 0..<count where !settingsPath.isEmpty { settingsPath.removeLast() }
    }
    
    func popToRootSettings() {
        settingsPath = NavigationPath()
    }
    
    func setPath(_ routes: [Route]) {
        schedulePath = NavigationPath()
        routes.forEach {
            schedulePath.append($0)
        }
    }
}
