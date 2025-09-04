//
//  Carrier.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/09/04.
//

import SwiftUI

struct Carrier: Identifiable, Hashable {
    let id = UUID()
    let companyName: String
    let companyLogo: String
    let email: String
    let phoneNumber: String
}
