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
    
    var state: LoadState<[Settlement]> = .idle
    var settlements: [Settlement] = []
    
    init() {
        self.networkService = .shared
    }
    
    func loadSettlements() async {
        state = .loading
        do {
            let response = try await networkService.getAllStations()
            settlements = response.countries?
                .filter { $0.title == "Россия" } // filtering by country name to reduce amount of data
                .flatMap { $0.regions ?? [] }
                .flatMap { $0.settlements ?? [] }
                .filter {
                    guard let title = $0.title else { return false }
                    return !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
                } ?? []
            
            state = .success(settlements)
        } catch is URLError {
            state = .failure(.network)
        } catch {
            print(error)
            state = .failure(.server)
        }
    }
}
