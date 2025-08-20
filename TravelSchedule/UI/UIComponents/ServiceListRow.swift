//
//  ServiceListRow.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/20.
//

import SwiftUI

struct ServiceListRow: View {
    let service: Service
    
    var body: some View {
        ZStack {
            VStack {
                HStack(alignment: .top) {
                    HStack {
                        Image(service.companyLogo)
                            .resizable()
                            .frame(width: 38, height: 38)
                            .clipped()
                            .cornerRadius(12)
                            
                        VStack(alignment: .leading, spacing: 2) {
                            Text(service.companyName)
                                .lineLimit(1)
                                .font(.regular17)
                                .foregroundColor(.ypBlackUniv)
                            Text(service.transferInfo ?? "")
                                .lineLimit(1)
                                .font(.regular12)
                                .foregroundColor(.ypRed)
                        }
                    }
                    
                    Spacer()
                    
                    Text(service.date)
                        .font(.regular12)
                        .foregroundColor(.ypBlackUniv)
                }
                
                Spacer()
                
                HStack(spacing: 5) {
                    Text(service.departureTime)
                        .font(.regular17)
                        .foregroundColor(.ypBlackUniv)
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.ypGray)
                    Text(service.duration)
                        .font(.regular12)
                        .foregroundColor(.ypBlackUniv)
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.ypGray)
                    Text(service.arrivalTime)
                        .font(.regular17)
                        .foregroundColor(.ypBlackUniv)
                }
            }
            .padding(14)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 104)
        .background(RoundedRectangle(cornerRadius: 20).fill(.ypLightgray))
    }
}

#Preview {
    ServiceListRow(service: Service(companyName: "РЖД",
                                    companyLogo: "BrandLogoExample",
                                    transferInfo: "Пересадка в Костроме",
                                    date: "14 января",
                                    departureTime: "22:30",
                                    arrivalTime: "08:15",
                                    duration: "20 часов")
    )
}
