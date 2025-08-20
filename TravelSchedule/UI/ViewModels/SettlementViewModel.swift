//
//  SettlementViewModel.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/19.
//

import Foundation

@Observable final class SettlementViewModel {
    var settlements: [Settlement] = []
    
    init() {
        loadMockData()
    }
    
    private func loadMockData() {
        settlements = [
            Settlement(
                name: "Москва",
                stations: [
                    "Казанский вокзал", "Ленинградский вокзал", "Курский вокзал",
                    "Киевский вокзал", "Павелецкий вокзал", "Белорусский вокзал",
                    "Савёловский вокзал", "Рижский вокзал", "Ярославский вокзал",
                    "Аэроэкспресс Шереметьево", "Аэроэкспресс Внуково"
                ].map { Station(name: $0) }
            ),
            Settlement(
                name: "Санкт Петербург",
                stations: [
                    "Московский вокзал", "Ладожский вокзал", "Витебский вокзал",
                    "Балтийский вокзал", "Финляндский вокзал"
                ].map { Station(name: $0) }
            ),
            Settlement(
                name: "Сочи",
                stations: [
                    "Сочи", "Адлер", "Имеретинский Курорт",
                    "Хоста", "Лоо", "Лазаревское", "Мацеста", "Кудепста"
                ].map { Station(name: $0) }
            ),
            Settlement(
                name: "Горный воздух",
                stations: [
                    "Центральная", "Верхняя", "Снежная", "Южный склон", "Северный склон"
                ].map { Station(name: $0) }
            ),
            Settlement(
                name: "Краснодар",
                stations: [
                    "Краснодар-1", "Краснодар-2", "Пашковская",
                    "Пригородный", "Аэропорт Пашковский"
                ].map { Station(name: $0) }
            ),
            Settlement(
                name: "Казань",
                stations: [
                    "Казань-Пассажирская", "Казань-2", "Юдино",
                    "Васильево", "Зелёный Дол", "Арское"
                ].map { Station(name: $0) }
            ),
            Settlement(
                name: "Омск",
                stations: [
                    "Омск-Пассажирский", "Омск-Восточный", "Омск-Сортировочный",
                    "Нефтяники", "Любино", "Кормиловка"
                ].map { Station(name: $0) }
            )
        ]
    }
}
