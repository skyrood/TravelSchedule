//
//  ThreadStationsService.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/03.
//

import OpenAPIRuntime
import OpenAPIURLSession

typealias ThreadStations = Components.Schemas.ThreadStationsResponse

protocol ThreadStationsProtocol {
    func getRouteStations(uid: String) async throws -> ThreadStations
}

final class ThreadStationsService: ThreadStationsProtocol {
    private let client: Client
    
    private let apiKey: String
    
    init(client: Client, apiKey: String) {
        self.client = client
        self.apiKey = apiKey
    }
    
    func getRouteStations(uid: String) async throws -> ThreadStations {
        let response = try await client.getRouteStations(query: .init(
            apikey: apiKey,
            uid: uid
        ))
        
        return try response.ok.body.json
    }
}
