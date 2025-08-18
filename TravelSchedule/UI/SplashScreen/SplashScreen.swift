//
//  SplashScreen.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/18.
//

import SwiftUI

struct SplashScreen: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass

    var body: some View {
        Image("SplashScreen")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
            .offset(y: verticalSizeClass == .compact ? -280 : 0)
    }
}

#Preview {
    SplashScreen()
}
