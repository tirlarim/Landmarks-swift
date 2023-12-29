//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Stanislav Romanov on 23.12.2023.
//

import SwiftUI

@main
struct LandmarksApp: App {
  @State private var modelData: ModelData = ModelData()
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(modelData)
#if os(macOS)
        .onAppear {
          NSWindow.allowsAutomaticWindowTabbing = false
        }
#endif
    }
#if !os(watchOS)
    .commands(content: {LandmarksCommands()})
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
