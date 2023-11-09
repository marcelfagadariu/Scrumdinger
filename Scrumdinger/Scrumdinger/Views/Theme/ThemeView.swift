//
//  ThemeView.swift
//  Scrumdinger
//
//  Created by Marcel on 09.11.2023.
//

import SwiftUI

struct ThemeView: View {

    // MARK: - Properties

    let theme: Theme

    // MARK: - Body

    var body: some View {
        Text(theme.name)
            .padding(4)
            .frame(maxWidth: .infinity)
            .background(theme.mainColor)
            .foregroundStyle(theme.accentColor)
            .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}

#Preview {
    ThemeView(theme: .yellow)
}
