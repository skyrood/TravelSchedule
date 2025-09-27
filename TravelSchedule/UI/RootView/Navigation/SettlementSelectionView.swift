//
//  SettlementSelectionView.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/18.
//

import SwiftUI

extension Settlement: Identifiable {
    var id: String {
        codes?.yandex_code ?? (title ?? "unknown-\(UUID().uuidString)")
    }
}

struct SettlementSelectionView: View {
    @Environment(Router.self) private var router
    @Environment(TripBuilder.self) private var builder
    
    @Environment(SettlementViewModel.self) var viewModel
    
    @State private var query: String = ""
    @FocusState private var isSearchFocused: Bool
    
    let kind: SelectionKind
    
    init(kind: SelectionKind) {
        self.kind = kind
    }
    
    private var filteredSettlements: [Settlement] {
        let q = query.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !q.isEmpty else { return viewModel.settlements }
        
        return viewModel.settlements.filter { settlement in
            settlement.title?.localizedCaseInsensitiveContains(q) == true
        }
    }
    
    var body: some View {
        ZStack {
            Color.ypWhite.ignoresSafeArea()
            
            switch viewModel.state {
            case .loading:
                LoadingProgressView()
            case .success(_):
                if filteredSettlements.isEmpty {
                    noResults
                } else {
                    settlementList
                }
            case .idle, .failure:
                EmptyView()
            }
        }
        .navigationTitle("Выбор города")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            Toolbar()
        }
        .toolbarBackground(.hidden, for: .navigationBar)
        .safeAreaInset(edge: .top) { // workaround to counter the bug with navigation stack breaking when used with .searchable
            searchField
                .padding(.horizontal)
                .padding(.vertical, 0)
                .background(Color.ypWhite)
        }
    }
    
    var searchField: some View {
        VStack {
            HStack(spacing: 4) {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.searchElements)
                
                ZStack(alignment: .leading) {
                    Text("Введите запрос")
                        .foregroundStyle(Color(.searchElements))
                        .opacity(query.isEmpty ? 1 : 0)
                    
                    TextField("", text: $query)
                        .foregroundStyle(Color(.label))
                        .focused($isSearchFocused)
                }
                
                if !query.isEmpty {
                    Button {
                        query = ""
                        isSearchFocused = false
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(.searchElements)
                    }
                }
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 7)
            .background(.searchFieldBackground)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Color.ypWhite
                .frame(height: 8)
        }
    }
    
    var noResults: some View {
        VStack {
            Spacer()
            Text("Город не найден")
                .font(.bold24)
                .foregroundStyle(.ypBlack)
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
        .padding(.top, -8)
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
