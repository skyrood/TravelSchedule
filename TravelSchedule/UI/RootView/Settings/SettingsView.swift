//
//  SettingsView.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/22.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var colorSchemeManager: ColorSchemeManager
    
    let rowHeight: CGFloat = 60
    
    var body: some View {
        ZStack {
            Color.ypWhite.ignoresSafeArea()
            
            VStack {
                HStack {
                    Text("Темная тема")
                        .font(.regular17)
                    
                    Spacer()
                    
                    Toggle("", isOn: switchColorScheme())
                        .tint(.ypBlue)
                }
                .frame(height: rowHeight)
                
                HStack {
                    Text("Пользовательское соглашение")
                        .font(.regular17)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                }
                .frame(height: rowHeight)
                .contentShape(Rectangle())
                
                Spacer()
                
                Text("Приложение использует API «Яндекс.Расписания»\nВерсия 1.0 (beta)")
                    .font(.regular12)
                    .multilineTextAlignment(.center)
                    .lineSpacing(16)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 24)
        }
        .tabItem {
            Image(.settingsTabIcon)
                .renderingMode(.template)
        }
    }
    
    private func switchColorScheme() -> Binding<Bool> {
        Binding<Bool>(
            get: { colorSchemeManager.currentColorScheme == .dark },
            set: { isDark in
                colorSchemeManager.update(scheme: isDark ? .dark : .light)
            }
        )
    }
}

#Preview {
    SettingsView()
        .environmentObject(ColorSchemeManager())
}
