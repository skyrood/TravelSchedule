//
//  RootView.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/18.
//

import SwiftUI

struct RootView: View {
    @State private var dataLoading = true
    
    
    var body: some View {
//        SplashScreen()
        MainScreenTabView()
    }
}

#Preview {
    RootView()
}
