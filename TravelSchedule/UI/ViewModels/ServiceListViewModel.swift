//
//  ServiceListViewModel.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/20.
//

import SwiftUI

typealias Segment = Components.Schemas.Segment
typealias Carrier = Components.Schemas.Carrier

extension Segment {
    var formattedStartDate: String {
        guard let startDate = start_date else { return "" }
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = "yyyy-MM-dd"
        
        if let date = formatter.date(from: startDate) {
            let displayFormatter = DateFormatter()
            displayFormatter.locale = Locale(identifier: "ru_RU")
            displayFormatter.dateFormat = "d MMMM"
            return displayFormatter.string(from: date)
        }
        
        return startDate
    }
    
    var durationText: String {
        guard let duration = duration else { return "—" }
        
        let hours = duration / 3600
        let minutes = (duration % 3600) / 60
        
        if hours > 0 {
            return "\(hours) ч \(minutes) мин"
        } else {
            return "\(minutes) мин"
        }
    }
    
    var departureHour: Int? {
        guard let departure = departure else { return nil }
        let parts = departure.split(separator: ":")
        if let hourString = parts.first, let hour = Int(hourString) {
            return hour
        }
        return nil
    }
    
    var departureTimeText: String {
        guard let departure = departure else { return "—" }
        return String(departure.prefix(5))
    }
    
    var arrivalTimeText: String {
        guard let arrival = arrival else { return "—" }
        return String(arrival.prefix(5))
    }
}

@MainActor
@Observable
final class ServiceListViewModel {
    private var networkService: NetworkService = .shared
    
    var state: LoadState<[Segment]> = .idle
    
    var services: [Segment] = []
    
    func loadServices(from originStation: Station?, to destinationStation: Station?) async {
        guard services.isEmpty else { return }
        
        guard
            let originStationCode = originStation?.codes?.yandex_code,
            let destinationStationCode = destinationStation?.codes?.yandex_code
        else {
            print("no codes")
            return
        }
        
        state = .loading
        do {
            let response = try await networkService.getServicesBetweenStations(
                from: originStationCode,
                to: destinationStationCode
            )
            
            let segments = response.segments ?? []
            
            services = segments.sorted { lhs, rhs in
                if let lhsDate = lhs.start_date?.dateValue, let rhsDate = rhs.start_date?.dateValue {
                    if lhsDate != rhsDate {
                        return lhsDate < rhsDate
                    }
                }
                if let lhsTime = lhs.departure?.timeValue,
                   let rhsTime = rhs.departure?.timeValue {
                    return lhsTime < rhsTime
                }
                
                return false
            }
            
            state = .success(services)
        } catch is URLError {
            state = .failure(.network)
        } catch {
            state = .failure(.server)
        }
    }
    
    private static let iso: ISO8601DateFormatter = {
        let f = ISO8601DateFormatter()
        f.formatOptions = [.withInternetDateTime]
        return f
    }()
    
    private func d(_ s: String) -> Date {
        guard let date = Self.iso.date(from: s) else {
            preconditionFailure("Bad ISO8601 date: \(s)")
        }
        return date
    }
}
