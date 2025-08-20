//
//  Settlement.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/19.
//

import Foundation

struct Settlement: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var stations: [Station]
}
