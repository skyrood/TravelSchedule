//
//  Route.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/20.
//

import Foundation

enum GlobalRoute: Hashable, Sendable {
    case settlement(kind: SelectionKind)
    case station(settlement: Settlement, kind: SelectionKind)
    case serviceList
    case filters
    case carrierInfo(carrier: Carrier)
    case stories(index: Int = 0)
    case userAgreement
}
