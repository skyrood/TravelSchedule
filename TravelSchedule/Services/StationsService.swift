//
//  StationsService.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/03.
//

import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

typealias StationList = Components.Schemas.AllStationsResponse

protocol StationsServiceProtocol {
    func getAllStations(
        lang: String?,
        format: String?
    ) async throws -> StationList
}

final class StationsService: StationsServiceProtocol {
    private let client: Client
    
    private let apiKey: String
    
    init(client: Client, apiKey: String) {
        self.client = client
        self.apiKey = apiKey
    }
    
    func getAllStations(
        lang: String?,
        format: String?
    ) async throws -> StationList {
        let response = try await client.getAllStations(query: .init(
            apikey: apiKey,
            lang: lang,
            format: format
        ))
        
        let responseBody = try response.ok.body.text_html_charset_utf_hyphen_8
        
        let limit = 50 * 1024 * 1024
        let fullData = try await Data(collecting: responseBody, upTo: limit)
        
        print("Collected data of size: \(fullData.count) bytes")

        let allStations = try JSONDecoder().decode(StationList.self, from: fullData)
        
        

        
        return allStations
    }
}
