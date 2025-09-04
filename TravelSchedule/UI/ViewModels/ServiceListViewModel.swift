//
//  ServiceListViewModel.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/20.
//

import SwiftUI

final class ServiceListViewModel {
    var services: [Service] = []
    
    private let carriersViewModel = CarriersViewModel()
    
    init() {
        loadMockServices()
    }
    
    private func loadMockServices() {
        guard
            let rzd = carriersViewModel.carrier(named: "ОАО «РЖД»"),
            let fgk = carriersViewModel.carrier(named: "АО «ФГК»"),
            let uralLogistics = carriersViewModel.carrier(named: "ООО «Урал Логистика»")
        else { return }
        
        services = [
            Service(
                carrier: rzd,
                transferInfo: "С пересадкой в Костроме",
                departureTime: d("2025-01-14T22:30:00+03:00"),
                arrivalTime:   d("2025-01-15T08:15:00+03:00")
            ),
            Service(
                carrier: fgk,
                transferInfo: nil,
                departureTime: d("2025-01-15T01:15:00+03:00"),
                arrivalTime:   d("2025-01-15T09:00:00+03:00")
            ),
            Service(
                carrier: uralLogistics,
                transferInfo: nil,
                departureTime: d("2025-01-16T12:30:00+03:00"),
                arrivalTime:   d("2025-01-16T21:00:00+03:00")
            ),
            Service(
                carrier: rzd,
                transferInfo: "С пересадкой в Костроме",
                departureTime: d("2025-01-17T22:30:00+03:00"),
                arrivalTime:   d("2025-01-18T08:15:00+03:00")
            ),
            Service(
                carrier: rzd,
                transferInfo: nil,
                departureTime: d("2025-01-17T10:15:00+03:00"),
                arrivalTime:   d("2025-01-17T18:20:00+03:00")
            ),
            Service(
                carrier: fgk,
                transferInfo: "С пересадкой в Ярославле",
                departureTime: d("2025-01-18T06:30:00+03:00"),
                arrivalTime:   d("2025-01-18T14:10:00+03:00")
            ),
            Service(
                carrier: rzd,
                transferInfo: nil,
                departureTime: d("2025-01-19T09:45:00+03:00"),
                arrivalTime:   d("2025-01-19T19:30:00+03:00")
            ),
            Service(
                carrier: uralLogistics,
                transferInfo: nil,
                departureTime: d("2025-01-20T15:20:00+03:00"),
                arrivalTime:   d("2025-01-20T23:50:00+03:00")
            ),
            Service(
                carrier: fgk,
                transferInfo: "С пересадкой в Вологде",
                departureTime: d("2025-01-21T11:00:00+03:00"),
                arrivalTime:   d("2025-01-21T20:00:00+03:00")
            ),
            Service(
                carrier: rzd,
                transferInfo: nil,
                departureTime: d("2025-01-22T17:30:00+03:00"),
                arrivalTime:   d("2025-01-23T05:00:00+03:00")
            )
        ]
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
