//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Stanislav Romanov on 23.12.2023.
//

import SwiftUI

@main
struct LandmarksApp: App {
  @State private var modelData = ModelData()
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environment(modelData)
    }
    #if !os(watchOS)
    .commands {
      LandmarksCommands()
    }
    #endif
    #if os(watchOS)
    WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
    #endif
    #if os(macOS)
    Settings {
      LandmarkSettings()
    }
    #endif
  }
}
