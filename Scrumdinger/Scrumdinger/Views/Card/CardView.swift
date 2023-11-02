//
//  CardView.swift
//  Scrumdinger
//
//  Created by Marcel on 02.11.2023.
//

import SwiftUI

struct CardView: View {

    let scrum: DailyScrum

    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading) {
            Text(scrum.title)
                .font(.headline)
            Spacer()
            HStack {
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                Spacer()
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
            }
        }
    }
}

#Preview {
    CardView(scrum: DailyScrum.sampleData[0])
}
