//
//  Service.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/20.
//

import SwiftUI

struct Service: Identifiable, Hashable {
    let id = UUID()
    let companyName: String
    let companyLogo: String
    let transferInfo: String?
    let date: String
    let departureTime: String
    let arrivalTime: String
    let duration: String
}
