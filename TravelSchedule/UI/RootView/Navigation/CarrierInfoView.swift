//
//  CarrierInfoView.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/22.
//

import SwiftUI

struct CarrierInfoView: View {
    @Environment(\.dismiss) var dismiss
    
    let carrier: Carrier
    
    var body: some View {
        ZStack {
            Color.ypWhite.ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 16) {
                carrierLogo
                carrierName
                carrierContactInfo
                
                Spacer()
            }
        }
        .navigationTitle("Информация о перевозчике")
        .padding(16)
        .background(.ypWhite)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            Toolbar()
        }
        .toolbarBackground(.ypWhite, for: .navigationBar)
    }
    
    var carrierLogo: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24)
                .fill(Color.ypWhiteUniv)
            
            
            Image(carrier.companyLogoBig)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
        }
        .frame(height: 104)
    }
    
    var carrierName: some View {
        Text(carrier.companyName)
            .font(.bold24)
    }
    
    var carrierContactInfo: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                Text("E-mail")
                    .font(.regular17)
                
                Link(destination: URL(string: "mailto:\(carrier.email)")!) {
                    Text(carrier.email)
                        .font(.regular12)
                        .foregroundColor(.ypBlue)
                }
            }
            .frame(height: 60)
            
            VStack(alignment: .leading, spacing: 0) {
                Text("Телефон")
                    .font(.regular17)
                
                Link(destination: URL(string: "tel:\(carrier.phoneNumber)")!) {
                    Text(carrier.phoneNumber)
                        .font(.regular12)
                        .foregroundColor(.ypBlue)
                }
            }
            .frame(height: 60)
        }
    }
}

#Preview {
    CarrierInfoView(carrier: Carrier(
        companyName: "ОАО «РЖД»",
        companyLogo: "RussianRailwaysLogo",
        companyLogoBig: "RussianRailwaysLogoBig",
        email: "support@rzd.ru",
        phoneNumber: "+7 (800) 775-00-00"
    ))
}
