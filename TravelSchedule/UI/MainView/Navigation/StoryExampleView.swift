//
//  SwiftUIView.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/18.
//

import SwiftUI

struct StoryExampleView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(.storyExample)
                .resizable()
                .scaledToFill()
                .frame(width: 92, height: 140)
                .clipped()
                .cornerRadius(16)
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                .padding(.bottom, 12)
                .padding(.leading, 8)
                .padding(.trailing, 8)
                .lineLimit(3)
                .truncationMode(.tail)
                .font(.regular12)
                .foregroundColor(.ypWhiteUniv)
                
        }
        .frame(width: 92, height: 140)
        .cornerRadius(20)
    }
}

#Preview {
    StoryExampleView()
}
