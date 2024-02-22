//
//  WaterTrackerApp.swift
//  WaterTracker


import SwiftUI

@main

struct WaterTrackerApp: App {
    @StateObject private var user = User(weight: 80) // Example initial weight, adjust as needed.
    @AppStorage("isOnboardingCompleted") private var isOnboardingCompleted: Bool = false

    var body: some Scene {
        WindowGroup {
            Splash()
                .environmentObject(user)
        }
    }
}
