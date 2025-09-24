//
//  ServiceListRow.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/20.
//

import SwiftUI

struct ServiceListRow: View {
    let service: Segment
    
    var body: some View {
        ZStack {
            VStack {
                HStack(alignment: .top) {
                    HStack {
                        if let logoURL = service.thread?.carrier?.logo,
                           let url = URL(string: logoURL) {
                            AsyncImage(url: url) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 38, height: 38)
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                            } placeholder: {
                                Image(systemName: "xmark")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundStyle(.ypGray)
                                    .frame(width: 38, height: 38)
                                    .background(
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(Color.ypGray.opacity(0.2))
                                    )
                            }
                        } else {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.ypGray)
                                .frame(width: 38, height: 38)
                        }
                        
                        VStack(alignment: .leading, spacing: 2) {
                            Text(service.thread?.carrier?.title ?? "Без названия")
                                .lineLimit(1)
                                .font(.regular17)
                                .foregroundStyle(.ypBlackUniv)
                            Text(service.has_transfers == true ? "С пересадками" : " ")
                                .lineLimit(1)
                                .font(.regular12)
                                .foregroundStyle(service.has_transfers == true ? .ypRed : .clear)
                        }
                    }
                    
                    Spacer()
                    
                    Text(service.formattedStartDate)
                        .font(.regular12)
                        .foregroundStyle(.ypBlackUniv)
                }
                
                Spacer()
                
                HStack(spacing: 5) {
                    Text(service.departureTimeText)
                        .font(.regular17)
                        .foregroundStyle(.ypBlackUniv)
                    Rectangle()
                        .frame(height: 1)
                        .foregroundStyle(.ypGray)
                    Text(service.durationText)
                        .font(.regular12)
                        .foregroundStyle(.ypBlackUniv)
                    Rectangle()
                        .frame(height: 1)
                        .foregroundStyle(.ypGray)
                    Text(service.arrivalTimeText)
                        .font(.regular17)
                        .foregroundStyle(.ypBlackUniv)
                }
            }
            .padding(14)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 104)
        .background(RoundedRectangle(cornerRadius: 20).fill(.ypLightgray))
    }
}
