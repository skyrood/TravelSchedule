//
//  ServiceListView.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/20.
//

import SwiftUI

struct ServiceListView: View {
    @State private var viewModel = ServiceListViewModel()
    @Environment(Router.self) private var router
    @Environment(TripBuilder.self) private var builder
    @Environment(ServicesFiltersViewModel.self) private var filters
    @Environment(\.dismiss) private var dismiss
    
    private var filteredServices: [Service] {
        viewModel.services.filter { filters.matches($0) }
    }
    
    var body: some View {
        ZStack {
            ScrollView {
                Text(builder.routeDescription())
                    .font(.bold24)
                    .foregroundColor(.ypBlack)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                LazyVStack {
                    if filteredServices.isEmpty {
                        Text("Вариантов нет")
                            .font(.bold24)
                    } else {
                        ForEach(filteredServices) { service in
                            ServiceListRow(service: service)
                        }
                    }
                }
                
                Color.clear.frame(height: 84)
            }
            .padding(.top, 16)
            
            VStack {
                Spacer()
                
                Button {
                    router.go(to: .filters)
                } label: {
                    Text("Уточнить время")
                        .font(.bold17)
                        .foregroundColor(.ypWhiteUniv)
                        .frame(maxWidth: .infinity, minHeight: 60)
                        .contentShape(Rectangle())
                }
                .background(RoundedRectangle(cornerRadius: 20).fill(.ypBlue))
                .padding(.bottom, 24)
            }
        }
        .padding(.horizontal, 16)
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
    ServiceListView()
        .environment(Router())
        .environment(TripBuilder())
        .environment(ServicesFiltersViewModel())
}
