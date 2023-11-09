//
//  ThemePicker.swift
//  Scrumdinger
//
//  Created by Marcel on 09.11.2023.
//

import SwiftUI

struct ThemePicker: View {

    @Binding var selection: Theme

    var body: some View {
        Picker("Theme", selection: $selection) {
            ForEach(Theme.allCases) { item in
                ThemeView(theme: item)
                    .tag(item)
            }
        }
        .pickerStyle(.navigationLink)
    }
}

#Preview {
    ThemePicker(selection: .constant(.bubblegum))
}
