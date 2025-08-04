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
        
    init(client: Client) {
        self.client = client
    }
    
    func getCopyrightInfo() async throws -> Copyright {
        let response = try await client.copyright(query: .init())
        
        return try response.ok.body.json
    }
}
