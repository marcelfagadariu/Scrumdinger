//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Marcel on 03.11.2023.
//

import SwiftUI

struct ScrumsView: View {

    let scrums: [DailyScrum]

    // MARK: - Body

    var body: some View {
        NavigationStack {
            List(scrums) { item in
                NavigationLink {
                    DetailView(scrum: item)
                } label: {
                    CardView(scrum: item)
                }
                .listRowBackground(item.theme.mainColor)
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
    ScrumsView(scrums: DailyScrum.sampleData)
}
