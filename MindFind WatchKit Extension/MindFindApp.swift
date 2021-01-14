//
//  MindFindApp.swift
//  MindFind WatchKit Extension
//
//  Created by Andrew Boppart on 1/9/21.
//

import SwiftUI

@main
struct MindFindApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
