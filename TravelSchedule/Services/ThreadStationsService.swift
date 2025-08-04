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
        
    init(client: Client) {
        self.client = client
    }
    
    func getRouteStations(uid: String) async throws -> ThreadStations {
        let response = try await client.getRouteStations(query: .init(uid: uid))
        
        return try response.ok.body.json
    }
}
