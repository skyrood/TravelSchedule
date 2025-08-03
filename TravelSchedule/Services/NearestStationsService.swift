//
//  NearestStationsService.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/02.
//

import OpenAPIRuntime
import OpenAPIURLSession

typealias NearestStations = Components.Schemas.NearestStationsResponse

protocol NearestStationsServiceProtocol {
    func getNearestStations(latitude: Double, longitude: Double, distance: Int) async throws -> NearestStations
}

final class NearestStationsService: NearestStationsServiceProtocol {
    private let client: Client
    
    private let apiKey: String
    
    init(client: Client, apiKey: String) {
        self.client = client
        self.apiKey = apiKey
    }
    
    func getNearestStations(
        latitude: Double,
        longitude: Double,
        distance: Int
    ) async throws -> NearestStations {
        let response = try await client.getNearestStations(query: .init(
            apikey: apiKey,
            lat: latitude,
            lng: longitude,
            distance: distance
        ))
        
        return try response.ok.body.json
    }
}
