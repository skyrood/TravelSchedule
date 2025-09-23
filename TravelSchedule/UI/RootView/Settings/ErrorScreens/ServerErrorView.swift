//
//  ServerErrorView.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/22.
//

import SwiftUI

struct ServerErrorView: View {
    var body: some View {
        ZStack {
            Color.ypWhite.ignoresSafeArea()
            
            VStack {
                Spacer()
                Image(.serverError)
                    .resizable()
                    .frame(width: 223, height: 223)
                    .clipped()
                    .scaledToFit()
                Text("Ошибка сервера")
                    .font(.bold24)
                    .foregroundColor(.ypBlack)
                    .padding(.top, 16)
                Spacer()
            }
        }
        .toolbar(.hidden)
    }
}

#Preview {
    ServerErrorView()
}
