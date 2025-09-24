//
//  StoryView.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/09/07.
//

import SwiftUI

struct StoryView: View {
    @State var story: Story
    
    var body: some View {
        ZStack {
            storyBackgroundImage
            storyDescription
        }
    }
    
    var storyBackgroundImage: some View {
        GeometryReader { geometry in
            let screenSize = geometry.size
            
            story.backgroundImage
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(
                    maxWidth: screenSize.width,
                    maxHeight: screenSize.height
                )
                .clipShape(RoundedRectangle(cornerRadius: 40))
                .padding(.top, 7)
                .padding(.bottom, 17)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
    }
    
    var storyDescription: some View {
        VStack(alignment: .leading, spacing: 16) {
            Spacer()
            
            Text(story.title)
                .font(.bold34)
                .foregroundStyle(.ypWhiteUniv)
                .lineLimit(2)
            
            Text(story.description)
                .font(.regular20)
                .foregroundStyle(.ypWhiteUniv)
                .lineLimit(3)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 16)
        .padding(.bottom, 57)
    }
}

#Preview {
    StoryView(story: Story(backgroundImage: Image(.storyImage1), title: "Omg", description: "wtf wtf wtf wtf wtf wtf wtf wt f wtf wt fw t"))
}



