//
//  ConnectionErrorView.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/22.
//

import SwiftUI

struct ConnectionErrorView: View {
    var body: some View {
        ZStack {
            Color.ypWhite.ignoresSafeArea()
            
            VStack {
                Spacer()
                Image(.connectionError)
                    .resizable()
                    .frame(width: 223, height: 223)
                    .clipped()
                    .scaledToFit()
                Text("Нет интернета")
                    .font(.bold24)
                    .foregroundColor(.ypBlack)
                    .padding(.top, 16)
                Spacer()
            }
        }
    }
}

#Preview {
    ConnectionErrorView()
}
