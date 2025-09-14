//
//  CarriersViewModel.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/09/04.
//

import SwiftUI

final class CarriersViewModel {
    private var carriers: [Carrier] = []
    
    init() {
        loadMockCarriers()
    }
    
    private func loadMockCarriers() {
        let rzd = Carrier(
            companyName: "ОАО «РЖД»",
            companyLogo: "RussianRailwaysLogo",
            companyLogoBig: "RussianRailwaysLogoBig",
            email: "support@rzd.ru",
            phoneNumber: "+7 (800) 775-00-00"
        )
        
        let fgk = Carrier(
            companyName: "АО «ФГК»",
            companyLogo: "FGKLogo",
            companyLogoBig: "FGKLogoBig",
            email: "contact@fgk.ru",
            phoneNumber: "+7 (495) 123-45-67"
        )
        
        let uralLogistics = Carrier(
            companyName: "ООО «Урал Логистика»",
            companyLogo: "UralLogisticsLogo",
            companyLogoBig: "UralLogisticsLogoBig",
            email: "info@urallogistics.ru",
            phoneNumber: "+7 (343) 777-88-99"
        )
        
        carriers = [rzd, fgk, uralLogistics]
    }

    func carrier(named name: String) -> Carrier? {
        carriers.first { $0.companyName == name }
    }
}
