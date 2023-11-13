//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Marcel on 03.11.2023.
//

import SwiftUI

struct ScrumsView: View {

    @Environment(\.scenePhase) private var scenePhase
    @Binding var scrums: [DailyScrum]
    @State var isPresentingNewScrumView: Bool = false
    let saveAction: () -> Void

    // MARK: - Body

    var body: some View {
        NavigationStack {
            List($scrums) { $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrum")
            .toolbar {
                Button(action: {
                    isPresentingNewScrumView = true
                }, label: {
                    Image(systemName: "plus")
                })
                .accessibilityLabel("New Scrum")
            }
        }
        .sheet(isPresented: $isPresentingNewScrumView) {
            NewScrumSheet(scrums: $scrums, isPresentingNewScrumView: $isPresentingNewScrumView)
        }
        .onChange(of: scenePhase) { phase, _ in
            if phase == .inactive { saveAction() }
        }
    }
}

#Preview {
    ScrumsView(scrums: .constant(DailyScrum.sampleData), saveAction: {})
}
