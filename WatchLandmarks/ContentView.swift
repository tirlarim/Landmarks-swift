//
//  ContentView.swift
//  WatchLandmarks
//
//  Created by Stanislav Romanov on 26.12.2023.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
  var body: some View {
    LandmarkList()
      .task {
        let center = UNUserNotificationCenter.current()
        _ = try? await center.requestAuthorization(
        options: [.alert, .sound, .badge]
        )
      }
  }
}

#Preview {
  ContentView()
    .environment(ModelData())
}
