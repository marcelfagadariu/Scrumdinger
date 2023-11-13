//
//  MeetingView.swift
//  Scrumdinger
//
//  Created by Marcel on 31.10.2023.
//

import SwiftUI
import AVFoundation

struct MeetingView: View {

    @Binding var scrum: DailyScrum
    @StateObject var scrumTimer = ScrumTimer()
    private var player: AVPlayer { AVPlayer.sharedDingPlayer }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(scrum.theme.mainColor)
            VStack {
                MeetingHeaderView(secondsElapsed: scrumTimer.secondsElapsed,
                                  secondsRemaining: scrumTimer.secondsRemaining,
                                  theme: scrum.theme)
                Circle()
                    .strokeBorder(lineWidth: 24)
                MeetingFooterView(speakers: scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker)
            }
            .onAppear {
                scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendees: scrum.attendees)
                scrumTimer.speakerChangedAction = {
                    player.seek(to: .zero)
                    player.play()
                }
                scrumTimer.startScrum()
            }
            .onDisappear {
                scrumTimer.stopScrum()
            }
            .navigationBarTitleDisplayMode(.inline)
            .foregroundStyle(scrum.theme.accentColor)
            .padding()
        }
    }
}

#Preview {
    MeetingView(scrum: .constant(DailyScrum.sampleData[0]))
}
