//
//  StoriesViewModel.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/09/07.
//

import SwiftUI

struct Story {
    let backgroundImage: Image
    let title: String
    let description: String
}

@Observable
final class StoriesViewModel {
    var stories: [Story] = []
    
    init() {
        loadMockStories()
    }
    private func loadMockStories() {
        stories = [
            Story(
                backgroundImage: Image(.storyImage1),
                title: "🎉 ⭐️ ❤️",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor quam id massa faucibus dignissim. Nullam eget metus id nisl malesuada condimentum. Nam viverra fringilla erat, ut fermentum nunc feugiat eu."
            ),
            
            Story(
                backgroundImage: Image(.storyImage2),
                title: "😍 🌸 🥬",
                description: "Second Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor quam id massa faucibus dignissim. Nullam eget metus id nisl malesuada condimentum. Nam viverra fringilla erat, ut fermentum nunc feugiat eu."
            ),
            
            Story(
                backgroundImage: Image(.storyImage3),
                title: "🧀 🥑 🥚",
                description: "This is yet another Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor quam id massa faucibus dignissim. Nullam eget metus id nisl malesuada condimentum. Nam viverra fringilla erat, ut fermentum nunc feugiat eu.."
            )
        ]
    }
}
