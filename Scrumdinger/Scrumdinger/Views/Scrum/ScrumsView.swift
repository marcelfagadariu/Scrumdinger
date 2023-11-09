//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Marcel on 03.11.2023.
//

import SwiftUI

struct ScrumsView: View {

    @Binding var scrums: [DailyScrum]

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
                Button(action: {}, label: {
                    Image(systemName: "plus")
                })
                .accessibilityLabel("New Scrum")
            }
        }
    }
}

#Preview {
    ScrumsView(scrums: .constant(DailyScrum.sampleData))
}
