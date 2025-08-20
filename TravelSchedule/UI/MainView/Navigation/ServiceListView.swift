//
//  ServiceListView.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/20.
//

import SwiftUI

struct ServiceListView: View {
    @State private var viewModel = ServiceListViewModel()
    @Environment(TripBuilder.self) private var builder
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView {
            Text(builder.routeDescription())
                .font(.bold24)
                .foregroundColor(.ypBlack)
            
            LazyVStack {
                ForEach(viewModel.services) { service in
                    ServiceListRow(service: service)
                }
            }
        }
        .padding(16)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                }
            }
        }
    }
}

#Preview {
    ServiceListView()
        .environment(TripBuilder())
}
