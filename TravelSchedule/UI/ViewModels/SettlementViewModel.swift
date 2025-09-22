//
//  SettlementViewModel.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/19.
//

import Foundation

typealias Settlement = Components.Schemas.Settlement
typealias Station = Components.Schemas.Station

@MainActor
@Observable
final class SettlementViewModel {
    private var networkService: NetworkService
    var isLoadingData = true
    var loadError: Error?
    
    var settlements: [Settlement] = []
    
    init() {
        self.networkService = .shared
    }
    
    func loadSettlements() async {
        do {
            print("start loading")
            let response = try await networkService.getAllStations()
            settlements = response.countries?
                .flatMap { $0.regions ?? [] }
                .flatMap { $0.settlements ?? [] }
                .filter {
                    guard let title = $0.title else { return false }
                    return !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
                } ?? []
            
            print("settlements count: \(settlements.count)")
            
            print("loading complete")
            isLoadingData = false
        } catch {
            loadError = error
            isLoadingData = false
        }
    }
}
