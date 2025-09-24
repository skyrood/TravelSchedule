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
    @Environment(ServicesFilters.self) private var filters
    
    private var filteredServices: [Segment] {
        viewModel.services.filter { filters.matches($0) }
    }
    
    private enum Constants {
        static let bottomPadding: CGFloat = 92
    }
    
    var body: some View {
        ZStack {
            Color.ypWhite.ignoresSafeArea()
            
            serviceList
            filtersButton
        }
        .padding(.horizontal, 16)
        .background(.ypWhite)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            Toolbar()
        }
        .toolbarBackground(.ypWhite, for: .navigationBar)
        .task {
            await viewModel.loadServices(
                from: builder.from.station,
                to: builder.to.station
            )
        }
    }
    
    var serviceList: some View {
        ZStack {
            Color.ypWhite.ignoresSafeArea()
            
            VStack {
                switch viewModel.state {
                case .loading:
                    tripInfo
                    LoadingProgressView()
                        .padding(.bottom, Constants.bottomPadding)
                case .success:
                    if filteredServices.isEmpty {
                        VStack {
                            tripInfo
                            noResults
                                .padding(.bottom, Constants.bottomPadding)
                            Spacer()
                        }
                    } else {
                        ScrollView {
                            VStack {
                                tripInfo
                                servicesList
                            }
                            .padding(.bottom, Constants.bottomPadding)
                        }
                        .scrollContentBackground(.hidden)
                    }
                    
                case .idle, .failure:
                    EmptyView()
                }
            }
        }
    }
    
    var tripInfo: some View {
        Text(builder.routeDescription())
            .padding(.top, 16)
            .font(.bold24)
            .foregroundStyle(.ypBlack)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var noResults: some View {
        VStack {
            Spacer()
            Text("Вариантов нет")
                .font(.bold24)
                .foregroundStyle(.ypBlack)
            Spacer()
        }
    }
    
    var servicesList: some View {
        LazyVStack {
            ForEach(filteredServices, id: \.self) { service in
                if let carrier = service.thread?.carrier {
                    Button {
                        router.go(to: .carrierInfo(carrier: carrier))
                    } label: {
                        ServiceListRow(service: service)
                    }
                    .buttonStyle(.plain)
                } else {
                    ServiceListRow(service: service)
                }
            }
        }
    }
    
    var filtersButton: some View {
        VStack {
            Spacer()
            
            Button {
                router.go(to: .filters)
            } label: {
                Text("Уточнить время")
                    .font(.bold17)
                    .foregroundStyle(.ypWhiteUniv)
                    .frame(maxWidth: .infinity, minHeight: 60)
                    .contentShape(Rectangle())
            }
            .background(RoundedRectangle(cornerRadius: 20).fill(.ypBlue))
            .padding(.bottom, 24)
        }
    }
}

#Preview {
    ServiceListView()
        .environment(Router())
        .environment(TripBuilder())
        .environment(ServicesFilters())
}
