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
    func getServicesBetweenStations(
        fromStation: String,
        toStation: String,
        format: String?,
        lang: String?,
        date: String?,
        transportTypes: String?,
        system: String?,
        showSystems: String?,
        offset: Int?,
        limit: Int?,
        addDaysMask: Bool?,
        resultTimeZone: String?,
        transfers: Bool?
    ) async throws -> ServicesBetweenStations
}

final class SearchService: SearchProtocol {
    private let client: Client
        
    init(client: Client) {
        self.client = client
    }
    
    func getServicesBetweenStations(
        fromStation: String,
        toStation: String,
        format: String?,
        lang: String?,
        date: String?,
        transportTypes: String?,
        system: String?,
        showSystems: String?,
        offset: Int?,
        limit: Int?,
        addDaysMask: Bool?,
        resultTimeZone: String?,
        transfers: Bool?
    ) async throws -> ServicesBetweenStations {
        let response = try await client.search(query: .init(
            from: fromStation,
            to: toStation,
            format: EnumMapper.makeEnum(from: format),
            lang: EnumMapper.makeEnum(from: lang),
            date: date,
            transport_types: EnumMapper.makeEnum(from: transportTypes),
            system: EnumMapper.makeEnum(from: system),
            show_systems: EnumMapper.makeEnum(from: showSystems),
            offset: offset,
            limit: limit,
            add_days_mask: addDaysMask,
            result_timezone: resultTimeZone,
            transfers: transfers
        ))
        
        return try response.ok.body.json
    }
}
