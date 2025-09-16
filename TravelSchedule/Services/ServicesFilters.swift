//
//  ServicesFilters.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/21.
//

import Foundation

enum DepartureTime: String, CaseIterable, Identifiable {
    case morning = "Утро 06:00 – 12:00"
    case day     = "День 12:00 – 18:00"
    case evening = "Вечер 18:00 – 00:00"
    case night   = "Ночь 00:00 – 06:00"
    
    var id: String { rawValue }
    
    func contains(hour: Int) -> Bool {
        switch self {
        case .morning: return (6..<12).contains(hour)
        case .day:     return (12..<18).contains(hour)
        case .evening: return (18..<24).contains(hour)
        case .night:   return (0..<6).contains(hour)
        }
    }
}

enum TransfersOption: String, CaseIterable, Identifiable {
    case yes = "Да"
    case no  = "Нет"
    
    var id: String { rawValue }
}

@Observable
final class ServicesFilters {
    var selectedTimes: Set<DepartureTime> = []
    var transfers: TransfersOption = .yes
    
    func toggle(_ time: DepartureTime) {
        if selectedTimes.contains(time) {
            selectedTimes.remove(time)
        } else {
            selectedTimes.insert(time)
        }
    }
    
    func matches(_ service: Service, calendar: Calendar = .current) -> Bool {
        let okByTime: Bool = {
            guard !selectedTimes.isEmpty else { return true }
            let hour = calendar.component(.hour, from: service.departureTime)
            return selectedTimes.contains { $0.contains(hour: hour) }
        }()
        
        let okByTransfers: Bool = {
            switch transfers {
            case .yes: return true
            case .no:  return !service.hasTransfers
            }
        }()
        
        return okByTime && okByTransfers
    }
}
