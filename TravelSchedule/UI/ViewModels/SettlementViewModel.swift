//
//  SettlementViewModel.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/19.
//

import Foundation

typealias Settlement = Components.Schemas.Settlement
typealias Station = Components.Schemas.Station

@MainActor
@Observable
final class SettlementViewModel {
    private var networkService: NetworkService
    var isLoadingData = true
    var loadError: Error?
    
    var settlements: [Settlement] = []
    
    init() {
        self.networkService = .shared
        //        loadMockData()
    }
    
    func loadSettlements() async {
        do {
            print("start loading")
            let response = try await networkService.getAllStations()
            settlements = response.countries?
                .flatMap { $0.regions ?? [] }
                .flatMap { $0.settlements ?? [] }
                .filter {
                    guard let title = $0.title else { return false }
                    return !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
                } ?? []
            
            print("settlements count: \(settlements.count)")
            
            print("loading complete")
            isLoadingData = false
        } catch {
            loadError = error
            isLoadingData = false
        }
    }
    
    //    private func loadMockData() {
    //        settlements = [
    //            Settlement(
    //                name: "Москва",
    //                stations: [
    //                    "Казанский вокзал", "Ленинградский вокзал", "Курский вокзал",
    //                    "Киевский вокзал", "Павелецкий вокзал", "Белорусский вокзал",
    //                    "Савёловский вокзал", "Рижский вокзал", "Ярославский вокзал",
    //                    "Аэроэкспресс Шереметьево", "Аэроэкспресс Внуково"
    //                ].map { Station(name: $0) }
    //            ),
    //            Settlement(
    //                name: "Санкт Петербург",
    //                stations: [
    //                    "Московский вокзал", "Ладожский вокзал", "Витебский вокзал",
    //                    "Балтийский вокзал", "Финляндский вокзал"
    //                ].map { Station(name: $0) }
    //            ),
    //            Settlement(
    //                name: "Сочи",
    //                stations: [
    //                    "Сочи", "Адлер", "Имеретинский Курорт",
    //                    "Хоста", "Лоо", "Лазаревское", "Мацеста", "Кудепста"
    //                ].map { Station(name: $0) }
    //            ),
    //            Settlement(
    //                name: "Горный воздух",
    //                stations: [
    //                    "Центральная", "Верхняя", "Снежная", "Южный склон", "Северный склон"
    //                ].map { Station(name: $0) }
    //            ),
    //            Settlement(
    //                name: "Краснодар",
    //                stations: [
    //                    "Краснодар-1", "Краснодар-2", "Пашковская",
    //                    "Пригородный", "Аэропорт Пашковский"
    //                ].map { Station(name: $0) }
    //            ),
    //            Settlement(
    //                name: "Казань",
    //                stations: [
    //                    "Казань-Пассажирская", "Казань-2", "Юдино",
    //                    "Васильево", "Зелёный Дол", "Арское"
    //                ].map { Station(name: $0) }
    //            ),
    //            Settlement(
    //                name: "Омск",
    //                stations: [
    //                    "Омск-Пассажирский", "Омск-Восточный", "Омск-Сортировочный",
    //                    "Нефтяники", "Любино", "Кормиловка"
    //                ].map { Station(name: $0) }
    //            )
    //        ]
    //    }
}
