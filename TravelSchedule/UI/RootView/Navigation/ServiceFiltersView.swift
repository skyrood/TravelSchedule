//
//  ServiceFiltersView.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/20.
//

import SwiftUI

struct ServiceFiltersView: View {
    @Environment(ServicesFilters.self) private var filters
    @Environment(Router.self) private var router
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color.ypWhite.ignoresSafeArea()
            
            ScrollView {
                departureTimeFilter
                transferOptionFilter
                Color.clear.frame(height: 86)
            }
            
            applyButton
        }
        .padding(.horizontal, 16)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            Toolbar()
        }
        .background(.ypWhite)
        .toolbarBackground(.ypWhite, for: .navigationBar)
    }
    
    var departureTimeFilter: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Время отправления")
                .padding(.vertical, 8)
            
            VStack(spacing: 0) {
                ForEach(DepartureTime.allCases) { time in
                    Button {
                        filters.toggle(time)
                    } label: {
                        HStack {
                            Text(time.rawValue)
                                .font(.regular17)
                            Spacer()
                            if filters.selectedTimes.contains(time) {
                                Image(systemName: "checkmark.square.fill")
                                    .font(.system(size: 20))
                            } else {
                                Image(systemName: "square")
                                    .font(.system(size: 20))
                            }
                        }
                        .frame(height: 60)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .foregroundColor(.ypBlack)
        .font(.bold24)
    }
    
    var transferOptionFilter: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Показывать варианты с пересадками")
                .padding(.vertical, 8)
            
            VStack(spacing: 0) {
                ForEach(TransfersOption.allCases) { option in
                    Button {
                        filters.transfers = option
                    } label: {
                        HStack {
                            Text(option.rawValue)
                                .font(.regular17)
                            Spacer()
                            Image(systemName: filters.transfers == option ? "largecircle.fill.circle" : "circle")
                                .font(.system(size: 20))
                        }
                        .frame(height: 60)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .foregroundColor(.ypBlack)
        .font(.bold24)
    }
    
    var applyButton: some View {
        VStack {
            Spacer()
            
            Button {
                dismiss()
            } label: {
                Text("Применить")
                    .font(.bold17)
                    .foregroundColor(.ypWhiteUniv)
                    .frame(maxWidth: .infinity, minHeight: 60)
                    .contentShape(Rectangle())
            }
            .background(RoundedRectangle(cornerRadius: 20).fill(.ypBlue))
            .padding(.bottom, 24)
        }
    }
}

#Preview {
    ServiceFiltersView()
        .environment(ServicesFilters())
        .environment(Router())
}
