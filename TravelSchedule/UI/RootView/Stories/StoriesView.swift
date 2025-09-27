//
//  StoriesView.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/09/07.
//

import SwiftUI
import Combine

struct StoriesView: View {
    private struct ProgressConfiguration {
        let timerTickInterval: TimeInterval
        let progressPerTick: CGFloat
        
        init(
            storiesCount: Int,
            secondsPerStory: TimeInterval = 5,
            timerTickInterval: TimeInterval = 0.001
        ) {
            self.timerTickInterval = timerTickInterval
            self.progressPerTick = 1.0 / CGFloat(storiesCount) / secondsPerStory * timerTickInterval
        }
    }
    
    @Environment(StoriesViewModel.self) private var viewModel
    @Environment(Router.self) private var router
    
    @State private var dragOffset: CGFloat = 0
    @GestureState private var isDragging = false
    @State private var verticalDragOffset: CGFloat = 0
    
    private var progressConfiguration: ProgressConfiguration { ProgressConfiguration(storiesCount: stories.count) }
    private var stories: [Story] { viewModel.stories }
    private var currentStory: Story { stories[currentStoryIndex] }
    private var currentStoryIndex: Int { Int(progress * CGFloat(stories.count)) }
    
    let startIndex: Int
    
    @State private var progress: CGFloat = 0
    @State private var timer: Timer.TimerPublisher = Timer.publish(every: 5, on: .main, in: .common)
    @State private var cancellable: Cancellable?
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            storyView
            progressBar
            closeButton
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            progress = CGFloat(startIndex) / CGFloat(viewModel.stories.count)
            timer = createTimer(progressConfiguration: progressConfiguration)
            cancellable = timer.connect()
            viewModel.markStoryAsViewed(at: currentStoryIndex)
        }
        .onDisappear {
            cancellable?.cancel()
        }
        .onReceive(timer) { _ in
            nextStory()
        }
        .onChange(of: currentStoryIndex) {
            viewModel.markStoryAsViewed(at: currentStoryIndex)
        }
    }
    
    var storyView: some View {
        ZStack {
            Color.ypBlackUniv.ignoresSafeArea()
            StoryView(story: stories[currentStoryIndex])
                .transition(.opacity)
                .id(currentStoryIndex)
                .onTapGesture {
                    nextStory(jumpToNext: true)
                    resetTimer()
                }
        }
        .animation(.easeInOut(duration: 0.5), value: currentStoryIndex)
        .gesture(
            DragGesture()
                .onEnded { value in
                    let horizontalAmount = value.translation.width
                    let threshold: CGFloat = 40

                    if horizontalAmount < -threshold {
                        nextStory(jumpToNext: true)
                        resetTimer()
                    } else if horizontalAmount > threshold {
                        previousStory()
                        resetTimer()
                    }
                }
        )
    }
    
    var progressBar: some View {
        ProgressBar(numberOfSections: stories.count, progress: progress)
            .padding(.horizontal, 12)
            .padding(.top, 35)
    }
    
    var closeButton: some View {
        Button("", image: .closeButton) {
            router.popToRoot()
        }
        .frame(width: 30, height: 30)
        .padding(.top, 57)
        .padding(.trailing, 15)
    }
    
    private func nextStory(jumpToNext: Bool = false) {
        if jumpToNext {
            let nextIndex = currentStoryIndex + 1
            progress = nextIndex < stories.count
            ? CGFloat(nextIndex) / CGFloat(stories.count) + 0.008 : 0.0
        } else {
            let newProgress = progress + progressConfiguration.progressPerTick
            progress = newProgress >= 1.0 ? 0.0 : newProgress
        }
    }
    
    private func resetTimer() {
        cancellable?.cancel()
        timer = Timer.publish(every: 0.001, on: .main, in: .common)
        cancellable = timer.connect()
    }
    
    private func createTimer(progressConfiguration: ProgressConfiguration) -> Timer.TimerPublisher {
        Timer.publish(every: TimeInterval(progressConfiguration.timerTickInterval), on: .main, in: .common)
    }
    
    private func previousStory() {
        let previousIndex = currentStoryIndex - 1
        guard previousIndex >= 0 else { return }

        progress = CGFloat(previousIndex) / CGFloat(stories.count)
    }
}

#Preview {
    StoriesView(startIndex: 0)
        .environment(Router())
        .environment(StoriesViewModel())
}
