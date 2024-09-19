//
//  StrokedCapsuleButtonStyle.swift
//  FlightyCloneSwiftUI
//
//  Created by Nour el houda Akbi on 19/9/2024.
//
// A simple button style that adds a subtle border to otherwise plain styled buttons.

import SwiftUI
struct StrokedCapsule: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, 10)
            .padding(.horizontal, 15)
            .foregroundStyle(.primary)
            .background(
                Capsule()
                    .stroke(.tertiary, lineWidth: 1)
            )
    }
}

