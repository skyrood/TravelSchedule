//
//  NetworkService.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/03.
//

import OpenAPIURLSession
import OpenAPIRuntime
import Foundation
import HTTPTypes

struct AuthenticationClientMiddleware: ClientMiddleware {
    let token: String
    
    func intercept(
        _ request: HTTPRequest,
        body: HTTPBody?,
        baseURL: URL,
        operationID: String,
        next: @Sendable (HTTPRequest, HTTPBody?, URL) async throws -> (HTTPResponse, HTTPBody?)
    ) async throws -> (HTTPResponse, HTTPBody?) {
        var newRequest = request
        newRequest.headerFields[.authorization] = "\(token)"
        return try await next(newRequest, body, baseURL)
    }
}

final class NetworkService {
    static let shared = NetworkService()
    
    let client: Client
    let apiKey: String = "86ce946c-528d-4cf4-9dc0-7030969c85eb"
    
    private init() {
        self.client = Client(
            serverURL: try! Servers.Server1.url(),
            transport: URLSessionTransport(),
            middlewares: [
                AuthenticationClientMiddleware(token: apiKey)
            ]
        )
    }
}

extension NetworkService {
    func getServicesBetweenStations(
        from: String,
        to: String,
        format: String? = nil,
        lang: String? = nil,
        date: String? = nil,
        transportTypes: String? = nil,
        system: String? = nil,
        showSystems: String? = nil,
        offset: Int? = nil,
        limit: Int? = nil,
        addDaysMask: Bool? = nil,
        resultTimeZone: String? = nil,
        transfers: Bool? = nil
    ) async throws -> ServicesBetweenStations {
        let service = SearchService(client: client)
        return try await service.getServicesBetweenStations(
            fromStation: from,
            toStation: to,
            format: format,
            lang: lang,
            date: date,
            transportTypes: transportTypes,
            system: system,
            showSystems: showSystems,
            offset: offset,
            limit: limit,
            addDaysMask: addDaysMask,
            resultTimeZone: resultTimeZone,
            transfers: transfers
        )
    }
    
    func getStationSchedule(
        station: String,
        lang: String? = nil,
        format: String? = nil,
        date: String? = nil,
        transportTypes: String? = nil,
        event: String? = nil,
        direction: String? = nil,
        system: String? = nil,
        resultTimezone: String? = nil
    ) async throws -> Schedule {
        let service = ScheduleService(client: client)
        return try await service.getStationSchedule(
            station: station,
            lang: lang,
            format: format,
            date: date,
            transportTypes: transportTypes,
            event: event,
            direction: direction,
            system: system,
            resultTimezone: resultTimezone
        )
    }
    
    func getRouteStations(uid: String) async throws -> ThreadStations {
        let service = ThreadStationsService(client: client)
        return try await service.getRouteStations(uid: uid)
    }
    
    func getNearestStations(
        latitude: Double,
        longitude: Double,
        distance: Int,
        format: String? = nil,
        lang: String? = nil
    ) async throws -> NearestStations {
        let service = NearestStationsService(client: client)
        return try await service.getNearestStations(
            latitude: latitude,
            longitude: longitude,
            distance: distance,
            format: format,
            lang: lang
        )
    }
    
    func getNearestSettlement(
        latitude: Double,
        longitude: Double,
        distance: Int,
        lang: String? = nil,
        format: String? = nil
    ) async throws -> NearestSettlement {
        let service = NearestSettlementService(client: client)
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
        system: String? = nil,
        lang: String? = nil,
        format: String? = nil
    ) async throws -> CarrierInfo {
        let service = CarrierService(client: client)
        return try await service.getCarrierInfo(
            code: code,
            system: system,
            lang: lang,
            format: format
        )
    }
    
    func getAllStations(
        lang: String? = nil,
        format: String? = nil
    ) async throws -> StationList {
        let service = StationsService(client: client)
        return try await service.getAllStations(
            lang: lang,
            format: format
        )
    }
    
    func getCopyrightInfo(format: String? = nil) async throws -> Copyright {
        let service = CopyrightService(client: client)
        return try await service.getCopyrightInfo(format: format)
    }
}

