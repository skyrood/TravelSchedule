//
//  UserAgreementView.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/09/06.
//

import SwiftUI

struct UserAgreementView: View {
    @State var viewModel: UserAgreementViewModel = UserAgreementViewModel()
    
    var body: some View {
        ZStack {
            Color.ypWhite.ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading) {
                    Text(viewModel.title)
                        .font(.bold24)
                        .padding(.bottom, 8)
                    
                    Text(viewModel.legalInfo)
                        .font(.regular17)
                        .padding(.bottom, 24)

                    Text(viewModel.subtitle)
                        .font(.bold24)
                        .padding(.bottom, 8)
                    
                    Text(viewModel.paragraph)
                        .font(.regular17)
                }
            }
            .padding(16)
        }
        .navigationTitle("Пользовательское соглашение")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            Toolbar()
        }
        .toolbarBackground(.ypWhite, for: .navigationBar)
    }
}

#Preview {
    UserAgreementView()
}
