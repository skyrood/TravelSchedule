//
//  StationListRow.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/19.
//

import SwiftUI

struct StationListRow: View {
    var station: Station
    
    let rowHeight: CGFloat = 60
    
    var body: some View {
        HStack {
            Text(station.name)
                .font(.regular17)
            Spacer()
        }
        .frame(height: rowHeight)
        .contentShape(Rectangle())
        .background(.ypWhite)
    }
}

#Preview {
    StationListRow(station: Station(name: "Москва-товарная"))
}
