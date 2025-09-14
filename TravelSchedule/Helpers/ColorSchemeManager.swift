//
//  ColorSchemeManager.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/09/06.
//

import SwiftUI

final class ColorSchemeManager: ObservableObject {
    @AppStorage("colorScheme") private var colorScheme: String = "light"
    
    @Published var currentColorScheme: ColorScheme
    
    init() {
        let storedValue = UserDefaults.standard.string(forKey: "colorScheme") ?? "light"
        self.currentColorScheme = storedValue == "dark" ? .dark : .light
    }
    
    func update(scheme: ColorScheme) {
        currentColorScheme = scheme
        colorScheme = scheme == .dark ? "dark" : "light"
    }
}
