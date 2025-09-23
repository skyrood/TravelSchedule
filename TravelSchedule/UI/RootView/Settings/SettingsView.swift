//
//  SettingsView.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/22.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var colorSchemeManager: ColorSchemeManager
    @Environment(Router.self) private var router
    
    let rowHeight: CGFloat = 60
    
    var body: some View {
        ZStack {
            Color.ypWhite.ignoresSafeArea()
            
            VStack {
                colorSchemeSwitch
                userAgreementButton
    
                Spacer()
                
                legalInfo
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 24)
        }
        .tabItem {
            Image(.settingsTabIcon)
                .renderingMode(.template)
        }
    }
    
    var colorSchemeSwitch: some View {
        HStack {
            Text("Темная тема")
                .font(.regular17)
            
            Spacer()
            
            Toggle("", isOn: switchColorScheme())
                .tint(.ypBlue)
        }
        .frame(height: rowHeight)
    }
    
    var userAgreementButton: some View {
        Button {
            router.go(to: .userAgreement)
        } label: {
            HStack {
                Text("Пользовательское соглашение")
                    .font(.regular17)
                
                Spacer()
                
                Image(systemName: "chevron.right")
            }
            .frame(height: rowHeight)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }
    
    var legalInfo: some View {
        Text("Приложение использует API «Яндекс.Расписания»\nВерсия 1.0 (beta)")
            .font(.regular12)
            .multilineTextAlignment(.center)
            .lineSpacing(16)
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
        .environmentObject(Router())
        .environmentObject(ColorSchemeManager())
}
