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
    func getStationSchedule(
        station: String,
        lang: String?,
        format: String?,
        date: String?,
        transportTypes: String?,
        event: String?,
        direction: String?,
        system: String?,
        resultTimezone: String?
    ) async throws -> Schedule
}

final class ScheduleService: ScheduleServiceProtocol {
    
    private let client: Client
    
    init(client: Client) {
        self.client = client
    }
    
    func getStationSchedule(
        station: String,
        lang: String?,
        format: String?,
        date: String?,
        transportTypes: String?,
        event: String?,
        direction: String?,
        system: String?,
        resultTimezone: String?
    ) async throws -> Schedule {
        let response = try await client.getStationSchedule(query: .init(
            station: station,
            lang: EnumMapper.makeEnum(from: lang),
            format: EnumMapper.makeEnum(from: format),
            date: date,
            transport_types: EnumMapper.makeEnum(from: transportTypes),
            event: EnumMapper.makeEnum(from: event),
            direction: direction,
            system: system,
            result_timezone: resultTimezone
        ))
        
        return try response.ok.body.json
    }
}
