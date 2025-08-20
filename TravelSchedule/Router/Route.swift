//
//  Route.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/20.
//

import Foundation

enum Route: Hashable {
    case settlement(kind: SelectionKind)
    case station(settlement: Settlement, kind: SelectionKind)
    case serviceList
}
