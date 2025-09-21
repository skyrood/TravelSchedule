//
//  TripBuilder.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/20.
//

import Observation

enum SelectionKind { case from, to }

struct PlaceSelection: Equatable {
    var settlement: Settlement?
    var station: Station?
}

@Observable final class TripBuilder {
    var from = PlaceSelection()
    var to = PlaceSelection()
    
    func setSettlement(settlement: Settlement, for kind: SelectionKind) {
        switch kind {
        case .from:
            if from.settlement?.codes?.yandex_code != settlement.codes?.yandex_code {
                from.settlement = settlement
                from.station = nil
            }
        case .to:
            if to.settlement?.codes?.yandex_code != settlement.codes?.yandex_code {
                to.settlement = settlement
                to.station = nil
            }
        }
    }
    
    func setStation(station: Station, for kind: SelectionKind) {
        switch kind {
        case .from: from.station = station
        case .to:   to.station   = station
        }
    }
    
    var isReady: Bool {
        from.settlement != nil && from.station != nil &&
        to.settlement   != nil && to.station   != nil
    }
    
    func routeParams() -> (from: Station, to: Station)? {
        guard let from = from.station, let to = to.station else { return nil }
        return (from, to)
    }
    
    func routeDescription() -> String {
        guard
            let fromSettlement = from.settlement,
            let fromStation = from.station,
            let toSettlement = to.settlement,
            let toStation = to.station
        else {
            return "Маршрут не выбран"
        }
        
        return "\(fromSettlement.title) (\(fromStation.title)) → \(toSettlement.title) (\(toStation.title))"
    }
}

