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
        ZStack {
            Color.ypWhite.ignoresSafeArea()
            
            if filteredStations.isEmpty {
                Spacer()
                Text("Станция не найдена")
                    .font(.bold24)
                    .foregroundColor(.ypBlack)
                Spacer()
            } else {
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
                .listStyle(.plain)
                .padding(.leading, 16)
                .padding(.trailing, 18)
            }
        }
        .background(.ypWhite)
        .navigationTitle("Выбор станции")
        .navigationBarBackButtonHidden(true)
        .searchable(text: $query, placement: .navigationBarDrawer(displayMode: .always), prompt: "Введите запрос")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .tint(.ypBlack)
                }
            }
        }
        .toolbarBackground(.ypWhite, for: .navigationBar)
    }
}


#Preview {
    StationSelectionView(
        settlement: Settlement(name: "Омск", stations: [Station(name: "Омск"), Station(name: "Не Омск")]),
        kind: .from
    )
    .environment(Router())
    .environment(TripBuilder())
    .environment(SettlementViewModel())
}
