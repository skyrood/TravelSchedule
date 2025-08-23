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
        Group {
            if dataLoading {
                SplashScreen()
            } else {
                RootTabView()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation {
                    dataLoading = false
                }
            }
        }
    }
}

#Preview {
    RootView()
}
