//
//  LoadingProgressView.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/09/24.
//

import SwiftUI

struct LoadingProgressView: View {
    public var body: some View {
        Spacer()
        ProgressView("Загрузка…")
            .progressViewStyle(CircularProgressViewStyle())
        Spacer()
    }
}
