//
//  StationSelectionView.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/19.
//

import SwiftUI

struct StationSelectionView: View {
    @Environment(Router.self) private var router
    @Environment(TripBuilder.self) private var builder
    @Environment(\.dismiss) private var dismiss
    @State private var query: String = ""
    
    let settlement: Settlement
    let kind: SelectionKind
    
    init(
        settlement: Settlement,
        kind: SelectionKind
    ) {
        self.settlement = settlement
        self.kind = kind
    }
    
    private var filteredStations: [Station] {
        let q = query.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !q.isEmpty else { return settlement.stations }
        return settlement.stations.filter { $0.name.localizedCaseInsensitiveContains(q) }
    }
    
    var body: some View {
        List {
            ForEach(filteredStations) { station in
                Button {
                    print("selected \(station.name)")
                    builder.setStation(station: station, for: kind)
                    router.pop(2)
                } label: {
                    StationListRow(station: station)
                }
                .buttonStyle(.plain)
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.hidden)
            }
        }
        .listStyle(.inset)
        .navigationTitle("Выбор станции")
        .navigationBarBackButtonHidden(true)
        .searchable(text: $query, placement: .navigationBarDrawer(displayMode: .always), prompt: "Введите запрос")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                }
            }
        }
        .padding(.leading, 16)
        .padding(.trailing, 18)
    }
}


#Preview {
    StationSelectionView(
        settlement: Settlement(name: "Омск", stations: [Station(name: "Омск")]),
        kind: .from
    )
    .environment(Router())
    .environment(TripBuilder())
    .environment(SettlementViewModel())
}
