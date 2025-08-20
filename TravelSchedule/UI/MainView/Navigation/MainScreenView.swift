//
//  MainScreenView.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/18.
//

import SwiftUI

struct MainScreenView: View {
    //    @State private var path = NavigationPath()
    //
    //    @State private var builder = TripBuilder()
    //    @State private var settlementViewModel = SettlementViewModel()
    @Environment(Router.self) private var router
    @Environment(TripBuilder.self) private var builder
    
    private var fromIsFilled: Bool {
        builder.from.settlement != nil && builder.from.station != nil
    }
    
    private var toIsFilled: Bool {
        builder.to.settlement != nil && builder.to.station != nil
    }
    
    private var fromTitle: String {
        if let settlement = builder.from.settlement,
           let station = builder.from.station {
            return "\(settlement.name) (\(station.name))"
        } else {
            return "Откуда"
        }
    }
    
    private var toTitle: String {
        if let settlement = builder.to.settlement,
           let station = builder.to.station {
            return "\(settlement.name) (\(station.name))"
        } else {
            return "Куда"
        }
    }
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    Color.clear.frame(width: 4)
                    
                    ForEach(0..<7) { index in
                        StoryExampleView()
                    }
                    
                    Color.clear.frame(width: 4)
                }
            }
            .padding(.vertical, 24)
            .fixedSize(horizontal: false, vertical: true)
            
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.ypBlue)
                    .frame(height: 128)
                    .frame(maxWidth: .infinity)
                
                HStack(spacing: 16) {
                    VStack(spacing: 0) {
                        Button {
                            router.go(to: .settlement(kind: .from))
                        } label: {
                            Text(fromTitle)
                                .foregroundColor(fromIsFilled ? .ypBlackUniv : .ypGray)
                                .font(.regular17)
                                .lineLimit(1)
                                .frame(maxWidth: .infinity, minHeight: 48, alignment: .leading)
                                .padding(.horizontal, 16)
                                .contentShape(Rectangle())
                        }
                        
                        Button {
                            router.go(to: .settlement(kind: .to))
                        } label: {
                            Text(toTitle)
                                .foregroundColor(toIsFilled ? .ypBlackUniv : .ypGray)
                                .font(.regular17)
                                .lineLimit(1)
                                .frame(maxWidth: .infinity, minHeight: 48, alignment: .leading)
                                .padding(.horizontal, 16)
                                .contentShape(Rectangle())
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.ypWhiteUniv)
                    )
                    
                    Button {
                        let temp = builder.from
                        builder.from = builder.to
                        builder.to = temp
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 18)
                                .fill(.ypWhiteUniv)
                                .frame(width: 36, height: 36)
                            
                            Image(systemName: "arrow.2.squarepath")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 16)
                                .foregroundColor(.ypBlue)
                        }
                    }
                    .padding(.trailing, 16)
                }
                .padding(.leading, 16)
            }
            .padding(.horizontal, 16)
            .padding(.top, 20)
            
            if builder.isReady {
                Button {
                    print("searching...")
                    router.go(to: .serviceList)
                } label: {
                    Text("Найти")
                        .font(.bold17)
                }
                .frame(width: 150, height: 60)
                .background(RoundedRectangle(cornerRadius: 20).fill(.ypBlue))
                .padding(.top, 16)
            }
            
            Spacer()
        }
        .background(.ypWhite)
    }
}

#Preview {
    MainScreenView()
        .environment(Router())
        .environment(TripBuilder())
}
