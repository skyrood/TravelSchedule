//
//  ServiceListViewModel.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/20.
//

import SwiftUI

class ServiceListViewModel {
    var services: [Service] = []
    
    init() {
        loadMockData()
    }
    
    private func loadMockData() {
        services = [
            Service(companyName: "РЖД",
                 companyLogo: "RussianRailwaysLogo",
                 transferInfo: "С пересадкой в Костроме",
                 date: "14 января",
                 departureTime: "22:30",
                 arrivalTime: "08:15",
                 duration: "20 часов"),
            
            Service(companyName: "ФГК",
                 companyLogo: "FGKLogo",
                 transferInfo: nil,
                 date: "15 января",
                 departureTime: "01:15",
                 arrivalTime: "09:00",
                 duration: "9 часов"),
            
            Service(companyName: "Урал логистика",
                 companyLogo: "UralLogisticsLogo",
                 transferInfo: nil,
                 date: "16 января",
                 departureTime: "12:30",
                 arrivalTime: "21:00",
                 duration: "9 часов"),
            
            Service(companyName: "РЖД",
                 companyLogo: "RussianRailwaysLogo",
                 transferInfo: "С пересадкой в Костроме",
                 date: "17 января",
                 departureTime: "22:30",
                 arrivalTime: "08:15",
                 duration: "20 часов"),
            
            Service(companyName: "РЖД",
                 companyLogo: "RussianRailwaysLogo",
                 transferInfo: nil,
                 date: "17 января",
                 departureTime: "10:15",
                 arrivalTime: "18:20",
                 duration: "8 часов"),
            
            Service(companyName: "ФГК",
                 companyLogo: "FGKLogo",
                 transferInfo: "С пересадкой в Ярославле",
                 date: "18 января",
                 departureTime: "06:30",
                 arrivalTime: "14:10",
                 duration: "7 часов"),
            
            Service(companyName: "РЖД",
                 companyLogo: "RussianRailwaysLogo",
                 transferInfo: nil,
                 date: "19 января",
                 departureTime: "09:45",
                 arrivalTime: "19:30",
                 duration: "10 часов"),
            
            Service(companyName: "Урал логистика",
                 companyLogo: "UralLogisticsLogo",
                 transferInfo: nil,
                 date: "20 января",
                 departureTime: "15:20",
                 arrivalTime: "23:50",
                 duration: "8 часов"),
            
            Service(companyName: "ФГК",
                 companyLogo: "FGKLogo",
                 transferInfo: "С пересадкой в Вологде",
                 date: "21 января",
                 departureTime: "11:00",
                 arrivalTime: "20:00",
                 duration: "9 часов"),
            
            Service(companyName: "РЖД",
                 companyLogo: "RussianRailwaysLogo",
                 transferInfo: nil,
                 date: "22 января",
                 departureTime: "17:30",
                 arrivalTime: "05:00",
                 duration: "12 часов")
        ]
    }
}
