//
//  API.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/03.
//

import OpenAPIURLSession

final class API {
    static let shared = API()
    
    let client: Client
    let apiKey: String = "86ce946c-528d-4cf4-9dc0-7030969c85eb"
    
    private init() {
        self.client = Client(
            serverURL: try! Servers.Server1.url(),
            transport: URLSessionTransport()
        )
    }
}

extension API {
    func getServicesBetweenStations(from: String, to: String) async throws -> ServicesBetweenStations {
        let service = SearchService(client: client, apiKey: apiKey)
        return try await service.getServicesBetweenStations(fromStation: from, toStation: to)
    }
    
    func getStationSchedule(station: String) async throws -> Schedule {
        let service = ScheduleService(client: client, apiKey: apiKey)
        return try await service.getStationSchedule(station: station)
    }
    
    func getRouteStations(uid: String) async throws -> ThreadStations {
        let service = ThreadStationsService(client: client, apiKey: apiKey)
        return try await service.getRouteStations(uid: uid)
    }
    
    func getNearestStations(latitude: Double, longitude: Double, distance: Int) async throws -> NearestStations {
        let service = NearestStationsService(client: client, apiKey: apiKey)
        return try await service.getNearestStations(latitude: latitude, longitude: longitude, distance: distance)
    }
    
    func getNearestSettlement(
        latitude: Double,
        longitude: Double,
        distance: Int,
        lang: String?,
        format: String?
    ) async throws -> NearestSettlement {
        let service = NearestSettlementService(client: client, apiKey: apiKey)
        return try await service.getNearestSettlement(
            latitude: latitude,
            longitude: longitude,
            distance: distance,
            lang: lang,
            format: format
        )
    }
    
    func getCarrierInfo(
        code: String,
        system: String?,
        lang: String?,
        format: String?
    ) async throws -> CarrierInfo {
        let service = CarrierService(client: client, apiKey: apiKey)
        return try await service.getCarrierInfo(
            code: code,
            system: system,
            lang: lang,
            format: format
        )
    }
    
    func getAllStations(
        lang: String?,
        format: String?
    ) async throws -> StationList {
        let service = StationsService(client: client, apiKey: apiKey)
        return try await service.getAllStations(
            lang: lang,
            format: format
        )
    }
    
    func getCopyrightInfo() async throws -> Copyright {
        let service = CopyrightService(client: client, apiKey: apiKey)
        return try await service.getCopyrightInfo()
    }
}

