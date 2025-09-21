//
//  MainScreenView.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/18.
//

import SwiftUI

struct MainScreenView: View {
    @Environment(Router.self) private var router
    @Environment(TripBuilder.self) private var builder
//    @State var storiesViewModel: StoriesViewModel = StoriesViewModel()
    @Environment(StoriesViewModel.self) var storiesViewModel
//    @Environment(StoriesViewModel.self) private var storiesViewModel
    
    @EnvironmentObject private var orientationObserver: OrientationObserver
    
    private var fromIsFilled: Bool {
        builder.from.settlement != nil && builder.from.station != nil
    }
    
    private var toIsFilled: Bool {
        builder.to.settlement != nil && builder.to.station != nil
    }
    
    private var fromTitle: String {
        if let settlementTitle = builder.from.settlement?.title,
           let stationTitle = builder.from.station?.title {
            return "\(settlementTitle) (\(stationTitle))"
        } else {
            return "Откуда"
        }
    }
    
    private var toTitle: String {
        if let settlementTitle = builder.to.settlement?.title,
           let stationTitle = builder.to.station?.title {
            return "\(settlementTitle) (\(stationTitle))"
        } else {
            return "Куда"
        }
    }
    
    var body: some View {
        Group {
            if orientationObserver.isLandscape {
                ScrollView { content }
            } else {
                content
            }
        }
        .background(.ypWhite)
    }
    
    var content: some View {
        VStack {
            storiesSection
            routeInputSection
            if builder.isReady {
                searchButton
            }
            Spacer()
        }
        .padding(.vertical, 68)
        .background(.ypWhite)
        .ignoresSafeArea(edges: .top)
    }
    
    var storiesSection: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                Color.clear.frame(width: 4)
                
                ForEach(Array(storiesViewModel.stories.enumerated()), id: \.element.id) { index, story in
                    StoryPreview(
                        story: story,
                        isViewed: story.isViewed
                    ) {
                        storiesViewModel.markStoryAsViewed(at: index)
                        router.go(to: .stories(index: index))
                    }
                }
                
                Color.clear.frame(width: 4)
            }
        }
        .padding(.bottom, 24)
        .fixedSize(horizontal: false, vertical: true)
    }
    
    var routeInputSection: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.ypBlue)
                .frame(height: 128)
                .frame(maxWidth: .infinity)
            
            HStack(spacing: 16) {
                VStack(spacing: 0) {
                    RouteInputField(
                        title: fromTitle,
                        isFilled: fromIsFilled,
                        action: {
                            router.go(to: .settlement(kind: .from))
                        }
                    )
                    
                    RouteInputField(
                        title: toTitle,
                        isFilled: toIsFilled,
                        action: {
                            router.go(to: .settlement(kind: .to))
                        }
                    )
                }
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.ypWhiteUniv)
                )
                
                Button {
                    let temp = builder.from
                    builder.from = builder.to
                    builder.to = temp
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 18)
                            .fill(.ypWhiteUniv)
                            .frame(width: 36, height: 36)
                        
                        Image(systemName: "arrow.2.squarepath")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 16)
                            .foregroundColor(.ypBlue)
                    }
                }
                .padding(.trailing, 16)
            }
            .padding(.leading, 16)
        }
        .padding(.horizontal, 16)
        .padding(.top, 20)
    }
    
    var searchButton: some View {
        Button {
            router.go(to: .serviceList)
        } label: {
            Text("Найти")
                .font(.bold17)
                .foregroundColor(.ypWhiteUniv)
                .frame(width: 150, height: 60)
                .contentShape(Rectangle())
        }
        .background(RoundedRectangle(cornerRadius: 20).fill(.ypBlue))
        .padding(.top, 16)
    }
}

#Preview {
    MainScreenView()
        .environmentObject(OrientationObserver())
        .environment(Router())
        .environment(TripBuilder())
}
