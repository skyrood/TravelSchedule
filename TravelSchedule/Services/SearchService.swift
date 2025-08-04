//
//  SearchService.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/03.
//

import OpenAPIRuntime
import OpenAPIURLSession

typealias ServicesBetweenStations = Components.Schemas.ServicesBetweenStations

protocol SearchProtocol {
    func getServicesBetweenStations(fromStation: String, toStation: String) async throws -> ServicesBetweenStations
}

final class SearchService: SearchProtocol {
    private let client: Client
        
    init(client: Client) {
        self.client = client
    }
    
    func getServicesBetweenStations(
        fromStation: String,
        toStation: String
    ) async throws -> ServicesBetweenStations {
        let response = try await client.search(query: .init(
            from: fromStation,
            to: toStation
        ))
        
        return try response.ok.body.json
    }
}
