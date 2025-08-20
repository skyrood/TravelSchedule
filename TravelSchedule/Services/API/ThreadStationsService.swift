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
    func getRouteStations(
        uid: String,
        from: String?,
        to: String?,
        format: String?,
        lang: String?,
        date: String?,
        showSystems: String?
    ) async throws -> ThreadStations
}

final class ThreadStationsService: ThreadStationsProtocol {
    private let client: Client
        
    init(client: Client) {
        self.client = client
    }
    
    func getRouteStations(
            uid: String,
            from: String? = nil,
            to: String? = nil,
            format: String? = nil,
            lang: String? = nil,
            date: String? = nil,
            showSystems: String? = nil
        ) async throws -> ThreadStations {
            let response = try await client.getRouteStations(query: .init(
                uid: uid,
                from: from,
                to: to,
                format: EnumMapper.makeEnum(from: format),
                lang: EnumMapper.makeEnum(from: lang),
                date: date,
                show_systems: EnumMapper.makeEnum(from: showSystems)
            ))
            return try response.ok.body.json
        }
}
