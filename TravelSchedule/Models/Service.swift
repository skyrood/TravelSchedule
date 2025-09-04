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
    let departureTime: Date
    let arrivalTime: Date
    
    var departureHHmm: String {
        TimeFormatters.time.string(from: departureTime)
    }
    var arrivalHHmm: String {
        TimeFormatters.time.string(from: arrivalTime)
    }
    
    var departureDate: String {
        TimeFormatters.dayMonth.string(from: departureTime)
    }
    
    var hasTransfers: Bool {
        transferInfo != nil && !(transferInfo?.isEmpty ?? true)
    }
    
    var durationText: String {
        let mins = max(0, Int(arrivalTime.timeIntervalSince(departureTime) / 60))
        let h = mins / 60
        let m = mins % 60
        if h > 0 && m > 0 { return "\(h) ч \(m) мин" }
        if h > 0          { return "\(h) ч" }
        return "\(m) мин"
    }
}

enum TimeFormatters {
    static let time: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }()
    
    static let dayMonth: DateFormatter = {
        let f = DateFormatter()
        f.locale = Locale(identifier: "ru_RU")
        f.dateFormat = "d MMMM"   // пример: "14 января"
        return f
    }()
}
