//
//  Router.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/20.
//

import SwiftUI

@Observable
final class Router {
    var path = NavigationPath()
    
    func go(to route: Route) {
        path.append(route)
    }
    
    func pop(_ count: Int = 1) {
        for _ in 0..<count where !path.isEmpty {
            path.removeLast()
        }
    }
    
    func popToRoot() {
        path = NavigationPath()
    }
    
    func setPath(_ routes: [Route]) {
        path = NavigationPath()
        routes.forEach {
            path.append($0)
        }
    }
}
