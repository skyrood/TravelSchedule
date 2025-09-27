//
//  Toolbar.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/23.
//

import SwiftUI

struct Toolbar: ToolbarContent {
    @Environment(Router.self) private var router
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button {
                router.pop()
            } label: {
                Image(systemName: "chevron.left")
                    .tint(.ypBlack)
            }
        }
    }
}
