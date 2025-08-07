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
    func getCopyrightInfo(
        format: String?
    ) async throws -> Copyright
}

final class CopyrightService: CopyrightServiceProtocol {
    private let client: Client
        
    init(client: Client) {
        self.client = client
    }
    
    func getCopyrightInfo(
        format: String?
    ) async throws -> Copyright {
        let response = try await client.copyright(query: .init(
            format: EnumMapper.makeEnum(from: format)
        ))
        
        return try response.ok.body.json
    }
}
