//
//  SettlementSelectionView.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/18.
//

import SwiftUI

struct SettlementSelectionView: View {
    @Environment(Router.self) private var router
    @Environment(TripBuilder.self) private var builder
    
    @State var viewModel: SettlementViewModel = SettlementViewModel()
    @State private var query: String = ""

    let kind: SelectionKind

    init(kind: SelectionKind) {
        self.kind = kind
    }
    
    private var filteredSettlements: [Settlement] {
        let q = query.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !q.isEmpty else { return viewModel.settlements }
        return viewModel.settlements.filter { s in
            s.name.localizedCaseInsensitiveContains(q)
        }
    }
    
    var body: some View {
        ZStack {
            Color.ypWhite.ignoresSafeArea()
            
            if filteredSettlements.isEmpty {
                noResults
            } else {
                settlementList
            }
        }
        .navigationTitle("Выбор города")
        .navigationBarBackButtonHidden(true)
        .searchable(text: $query, placement: .navigationBarDrawer(displayMode: .always), prompt: "Введите запрос")
        .toolbar {
            Toolbar()
        }
        .toolbarBackground(.ypWhite, for: .navigationBar)
    }
    
    var noResults: some View {
        VStack {
            Spacer()
            Text("Город не найден")
                .font(.bold24)
                .foregroundColor(.ypBlack)
            Spacer()
        }
    }
    
    var settlementList: some View {
        List {
            ForEach(filteredSettlements) { settlement in
                Button {
                    builder.setSettlement(settlement: settlement, for: kind)
                    router.go(to: .station(settlement: settlement, kind: kind))
                } label: {
                    SettlementListRow(settlement: settlement)
                }
                .buttonStyle(.plain)
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.hidden)
            }
        }
        .listStyle(.plain)
        .background(.ypWhite)
        .padding(.leading, 16)
        .padding(.trailing, 18)
    }
}

#Preview {
    SettlementSelectionView(
        kind: .from
    )
    .environment(Router())
    .environment(TripBuilder())
}
