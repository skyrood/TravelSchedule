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
                let totalSpacing = spacing * CGFloat(numberOfSections - 1)
                let segmentWidth = (geometry.size.width - totalSpacing) / CGFloat(numberOfSections)

                ZStack(alignment: .leading) {
                    // Фон
                    HStack(spacing: spacing) {
                        ForEach(0..<numberOfSections, id: \.self) { _ in
                            RoundedRectangle(cornerRadius: .progressBarCornerRadius)
                                .fill(Color.white)
                                .frame(width: segmentWidth, height: .progressBarHeight)
                        }
                    }

                    // Прогресс
                    HStack(spacing: spacing) {
                        ForEach(0..<numberOfSections, id: \.self) { index in
                            let sectionProgress = progress * CGFloat(numberOfSections)
                            let fillRatio = min(max(sectionProgress - CGFloat(index), 0), 1)

                            RoundedRectangle(cornerRadius: .progressBarCornerRadius)
                                .fill(Color.ypBlue)
                                .frame(width: segmentWidth * fillRatio, height: .progressBarHeight)
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

