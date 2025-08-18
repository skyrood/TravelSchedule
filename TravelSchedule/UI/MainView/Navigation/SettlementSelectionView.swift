//
//  SettlementSelectionView.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/18.
//

import SwiftUI

enum SelectionKind: Hashable { case from, to }

struct SettlementSelectionView: View {
    let kind: SelectionKind
    let initial: String
    
    let onSelect: (String) -> Void
    
    @Environment(\.dismiss) private var dismiss
    @State private var query: String = ""

    init(kind: SelectionKind, initial: String, onSelect: @escaping (String) -> Void) {
        self.kind = kind
        self.initial = initial
        self.onSelect = onSelect
        _query = State(initialValue: initial)
    }
    
    var body: some View {
        List {
            Button("Tokyo")  { select("Tokyo") }
            Button("Osaka")  { select("Osaka") }
        }
        .navigationTitle(kind == .from ? "Выбор пункта отправления" : "Выбор пункта назначения")
    }
    
    private func select(_ value: String) {
        onSelect(value)
        dismiss()
    }
}

#Preview {
    SettlementSelectionView(kind: .from, initial: "", onSelect: { _ in })
}
