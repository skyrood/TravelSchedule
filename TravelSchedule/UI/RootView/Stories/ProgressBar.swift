//
//  ProgressBar.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/09/07.
//

import SwiftUI

extension CGFloat {
    static let progressBarCornerRadius: CGFloat = 6
    static let progressBarHeight: CGFloat = 6
}

struct ProgressBar: View {
    let numberOfSections: Int
    let progress: CGFloat
    private let spacing: CGFloat = 6
    
    var body: some View {
        GeometryReader { geometry in
            let safeNumberOfSections = max(1, numberOfSections)
            let totalSpacing = spacing * CGFloat(safeNumberOfSections - 1)
            let totalWidth = geometry.size.width
            let segmentWidth = max(0, (totalWidth - totalSpacing) / CGFloat(safeNumberOfSections))
            
            ZStack(alignment: .leading) {
                HStack(spacing: spacing) {
                    ForEach(0..<safeNumberOfSections, id: \.self) { _ in
                        RoundedRectangle(cornerRadius: .progressBarCornerRadius)
                            .fill(Color.white)
                            .frame(width: segmentWidth, height: .progressBarHeight)
                    }
                }
                
                HStack(spacing: spacing) {
                    ForEach(0..<safeNumberOfSections, id: \.self) { index in
                        let sectionProgress = progress * CGFloat(safeNumberOfSections)
                        let fillRatio = min(max(sectionProgress - CGFloat(index), 0), 1)
                        let fillWidth = max(0, segmentWidth * fillRatio)
                        
                        RoundedRectangle(cornerRadius: .progressBarCornerRadius)
                            .fill(Color.ypBlue)
                            .frame(width: fillWidth, height: .progressBarHeight)
                    }
                }
            }
        }
        .frame(height: .progressBarHeight)
    }
}

private struct MaskView: View {
    let numberOfSections: Int
    
    var body: some View {
        HStack {
            ForEach(0..<numberOfSections, id: \.self) { _ in
                MaskFragmentView()
            }
        }
    }
}

private struct MaskFragmentView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: .progressBarCornerRadius)
            .fixedSize(horizontal: false, vertical: true)
            .frame(height: .progressBarHeight)
            .foregroundStyle(.white)
    }
}

#Preview {
    Color.ypRed
        .ignoresSafeArea()
        .overlay(
            ProgressBar(numberOfSections: 5, progress: 0.5)
                .padding()
        )
}

