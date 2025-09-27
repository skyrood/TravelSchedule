//
//  SettlementListRow.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/19.
//

import SwiftUI

struct SettlementListRow: View {
    var settlement: Settlement
    
    let rowHeight: CGFloat = 60
    
    var body: some View {
        HStack {
            Text(settlement.title ?? "-")
                .font(.regular17)
            Spacer()
            Image(systemName: "chevron.right")
        }
        .frame(height: rowHeight)
        .contentShape(Rectangle())
        .background(.ypWhite)
    }
}

#Preview {
    SettlementListRow(settlement: Settlement(title: "Москва", stations: [Station(title: "Москва-товарная")]))
}
