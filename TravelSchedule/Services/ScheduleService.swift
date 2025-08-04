//
//  ScheduleService.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/03.
//

import OpenAPIRuntime
import OpenAPIURLSession

typealias Schedule = Components.Schemas.ScheduleResponse

protocol ScheduleServiceProtocol {
    func getStationSchedule(station: String) async throws -> Schedule
}

final class ScheduleService: ScheduleServiceProtocol {
    private let client: Client
        
    init(client: Client) {
        self.client = client
    }
    
    func getStationSchedule(station: String) async throws -> Schedule {
        let response = try await client.getStationSchedule(query: .init(station: station))
        
        return try response.ok.body.json
    }
}
