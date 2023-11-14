//
//  ErrorView.swift
//  Scrumdinger
//
//  Created by Marcel on 14.11.2023.
//

import SwiftUI

struct ErrorView: View {

    let errorWrapper: ErrorWrapper
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            VStack {
                Text("An error has occurred!")
                    .font(.title)
                    .padding(.bottom)
                Text(errorWrapper.error.localizedDescription)
                    .font(.headline)
                Text(errorWrapper.guidance)
                    .font(.caption)
                    .padding(.top)
                Spacer()
            }
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(16)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Dismiss") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    enum SampleError: Error {
        case errorRequired
    }

    let wrapper = ErrorWrapper(error: SampleError.errorRequired,
                               guidance: "You can safely ignore this error.")
    return ErrorView(errorWrapper: wrapper)
}
