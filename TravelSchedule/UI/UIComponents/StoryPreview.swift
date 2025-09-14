//
//  StoryPreview.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/18.
//

import SwiftUI

struct StoryPreview: View {
    var story: Story
    var isViewed: Bool
    let action: () -> Void
    
    var body: some View {
        ZStack(alignment: .bottom) {
            story.backgroundImage
                .resizable()
                .scaledToFill()
                .frame(width: 92, height: 140)
                .clipped()
                .cornerRadius(16)
                .opacity(isViewed ? 0.5 : 1)
                .overlay(RoundedRectangle(cornerRadius: 20)
                    .strokeBorder(story.isViewed ? Color.clear : Color.ypBlue, lineWidth: story.isViewed ? 0 : 4)
                )
            
            Text(story.description)
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
        .onTapGesture {
            action()
        }
    }
}

#Preview {
    StoryPreview(story: Story(backgroundImage: Image(.storyImage1), title: "Text", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."), isViewed: false, action: { print("Tapped") })
}
