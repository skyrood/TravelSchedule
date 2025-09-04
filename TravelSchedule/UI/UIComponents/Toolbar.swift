//
//  Toolbar.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/23.
//

import SwiftUI

struct Toolbar: ToolbarContent {
    @Environment(\.dismiss) private var dismiss
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button {
                dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .tint(.ypBlack)
            }
        }
    }
}
