//
//  Story.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/09/14.
//

import SwiftUI

struct Story {
    let id = UUID()
    let backgroundImage: Image
    let title: String
    let description: String
    var isViewed: Bool = false
}
