//
//  CarrierService.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/03.
//

import OpenAPIRuntime
import OpenAPIURLSession

typealias CarrierInfo = Components.Schemas.CarrierResponse

protocol CarrierServiceProtocol {
    func getCarrierInfo(
        code: String,
        system: String?,
        lang: String?,
        format: String?
    ) async throws -> CarrierInfo
}

final class CarrierService: CarrierServiceProtocol {
    private let client: Client
    
    private let apiKey: String
    
    init(client: Client, apiKey: String) {
        self.client = client
        self.apiKey = apiKey
    }
    
    func getCarrierInfo(
        code: String,
        system: String?,
        lang: String?,
        format: String?
    ) async throws -> CarrierInfo {
        let response = try await client.getCarrierInfo(query: .init(
            apikey: apiKey,
            code: code,
            system: system,
            lang: lang,
            format: format
        ))
        
        return try response.ok.body.json
    }
}
