//
//  RouteInputField.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/23.
//

import SwiftUI

struct RouteInputField: View {
    let title: String
    let isFilled: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .foregroundColor(isFilled ? .ypBlackUniv : .ypGray)
                .font(.regular17)
                .lineLimit(1)
                .frame(maxWidth: .infinity, minHeight: 48, alignment: .leading)
                .padding(.horizontal, 16)
                .contentShape(Rectangle())
        }
    }
}
