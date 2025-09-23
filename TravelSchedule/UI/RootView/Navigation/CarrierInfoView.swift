//
//  CarrierInfoView.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/22.
//

import SwiftUI

extension Carrier {
    var emailText: String {
        if let email = email, !email.isEmpty {
            return email
        } else {
            return "email отсутствует"
        }
    }
    
    var phoneText: String {
        if let phone = phone, !phone.isEmpty {
            return phone
        } else {
            return "Номер телефона отсутствует"
        }
    }
}

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
            
            if let logoURL = carrier.logo,
               let url = URL(string: logoURL) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 104)
                        .padding(.horizontal, 16)
                } placeholder: {
                    placeholderImage
                }
            } else {
                placeholderImage
            }
        }
        .frame(height: 104)
    }
    
    var carrierName: some View {
        Text(carrier.title ?? "-")
            .font(.bold24)
    }
    
    var carrierContactInfo: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                Text("E-mail")
                    .font(.regular17)
                
                Link(destination: URL(string: "mailto:\(String(describing: carrier.email))")!) {
                    Text(carrier.emailText)
                        .font(.regular12)
                        .foregroundColor(.ypBlue)
                }
            }
            .frame(height: 60)
            
            VStack(alignment: .leading, spacing: 0) {
                Text("Телефон")
                    .font(.regular17)
                
                Link(destination: URL(string: "tel:\(String(describing: carrier.phone))")!) {
                    Text(carrier.phoneText)
                        .font(.regular12)
                        .foregroundColor(.ypBlue)
                }
            }
            .frame(height: 60)
        }
    }
    
    private var placeholderImage: some View {
        Image(systemName: "xmark")
            .resizable()
            .scaledToFit()
            .foregroundColor(.ypGray)
            .frame(width: 48, height: 48)
    }
}

#Preview {
    CarrierInfoView(carrier: Carrier(
        title: "ОАО «РЖД»",
        phone: "+7 (800) 775-00-00",
        logo: "RussianRailwaysLogo",
        email: "support@rzd.ru"
    ))
}
