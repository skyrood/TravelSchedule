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
    func getNearestStations(
        latitude: Double,
        longitude: Double,
        distance: Int,
        format: String?,
        lang: String?
    ) async throws -> NearestStations
}

final class NearestStationsService: NearestStationsServiceProtocol {
    private let client: Client
        
    init(client: Client) {
        self.client = client
    }
    
    func getNearestStations(
            latitude: Double,
            longitude: Double,
            distance: Int,
            format: String?,
            lang: String?
        ) async throws -> NearestStations {
            let response = try await client.getNearestStations(query: .init(
                lat: latitude,
                lng: longitude,
                distance: distance,
                format: EnumMapper.makeEnum(from: format),
                lang: EnumMapper.makeEnum(from: lang)
            ))

            return try response.ok.body.json
        }
}
