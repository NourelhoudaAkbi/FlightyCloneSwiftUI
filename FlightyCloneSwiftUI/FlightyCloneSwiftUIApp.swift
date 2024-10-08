//
//  FlightyCloneSwiftUIApp.swift
//  FlightyCloneSwiftUI
//
//  Created by Nour el houda Akbi on 19/9/2024.
//

import SwiftUI

@main
struct FlightyCloneSwiftUIApp: App {
    @StateObject private var uiModel = UIModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(uiModel)
        }
    }
}
