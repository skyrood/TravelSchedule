//
//  CarrierInfoView.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/22.
//

import SwiftUI

struct CarrierInfoView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color.ypWhite.ignoresSafeArea()
            VStack {
                Spacer()
                Text("Информация о перевозчике")
                Spacer()
            }
        }
        .background(.ypWhite)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .tint(.ypBlack)
                }
            }
        }
        .toolbarBackground(.ypWhite, for: .navigationBar)
    }
}

#Preview {
    CarrierInfoView()
}
