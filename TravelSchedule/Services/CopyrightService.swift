//
//  CopyrightService.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/03.
//

import OpenAPIRuntime
import OpenAPIURLSession

typealias Copyright = Components.Schemas.CopyrightResponse

protocol CopyrightServiceProtocol {
    func getCopyrightInfo() async throws -> Copyright
}

final class CopyrightService: CopyrightServiceProtocol {
    private let client: Client
    
    private let apiKey: String
    
    init(client: Client, apiKey: String) {
        self.client = client
        self.apiKey = apiKey
    }
    
    func getCopyrightInfo() async throws -> Copyright {
        let response = try await client.copyright(query: .init(
            apikey: apiKey
        ))
        
        return try response.ok.body.json
    }
}
