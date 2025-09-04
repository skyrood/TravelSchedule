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
                        Image(service.carrier.companyLogo)
                            .resizable()
                            .frame(width: 38, height: 38)
                            .clipped()
                            .cornerRadius(12)
                            
                        VStack(alignment: .leading, spacing: 2) {
                            Text(service.carrier.companyName)
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
                    
                    Text(service.departureDate)
                        .font(.regular12)
                        .foregroundColor(.ypBlackUniv)
                }
                
                Spacer()
                
                HStack(spacing: 5) {
                    Text(service.departureHHmm)
                        .font(.regular17)
                        .foregroundColor(.ypBlackUniv)
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.ypGray)
                    Text(service.durationText)
                        .font(.regular12)
                        .foregroundColor(.ypBlackUniv)
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.ypGray)
                    Text(service.arrivalHHmm)
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
    ServiceListRow(
        service: Service(
            carrier: Carrier(
                companyName: "РЖД",
                companyLogo: "RussianRailwaysLogo",
                companyLogoBig: "RussianRailwaysLogoBig",
                email: "rzd@rzd.ru",
                phoneNumber: "+81 312 333 111"
            ),
            transferInfo: "Пересадка в Костроме",
            departureTime: ISO8601DateFormatter().date(from: "2025-01-14T22:30:00+03:00")!,
            arrivalTime: ISO8601DateFormatter().date(from: "2025-01-15T08:15:00+03:00")!
        )
    )
}
