//
//  SettingsView.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/22.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ZStack {
            Color.ypWhite.ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Настройки")
                    .font(.largeTitle)
                    .foregroundColor(.ypBlack)
                Spacer()
            }
        }
        .tabItem {
            Image(.settingsTabIcon)
                .renderingMode(.template)
        }
    }
}

#Preview {
    SettingsView()
}
