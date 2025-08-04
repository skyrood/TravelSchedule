//
//  NearestSettlementService.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/03.
//

import OpenAPIRuntime
import OpenAPIURLSession

typealias NearestSettlement = Components.Schemas.NearestSettlementResponse

protocol NearestSettlementServiceProtocol {
    func getNearestSettlement(
        latitude: Double,
        longitude: Double,
        distance: Int,
        lang: String?,
        format: String?
    ) async throws -> NearestSettlement
}

final class NearestSettlementService: NearestSettlementServiceProtocol {
    private let client: Client
        
    init(client: Client) {
        self.client = client
    }
    
    func getNearestSettlement(
        latitude: Double,
        longitude: Double,
        distance: Int = 10,
        lang: String? = nil,
        format: String? = nil
    ) async throws -> NearestSettlement {
        let response = try await client.getNearestSettlement(query: .init(
            lat: latitude,
            lng: longitude,
            distance: distance,
            lang: lang,
            format: format
        ))
        
        return try response.ok.body.json
    }
}
