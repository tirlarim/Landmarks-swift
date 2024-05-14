//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by Stanislav Romanov on 25.12.2023.
//

import SwiftUI

struct ProfileSummary: View {
  @Environment(ModelData.self) var modelData
  var profile: Profile
  
  var body: some View {
    @Bindable var modelData = modelData
    ScrollView {
      VStack(alignment: .leading, spacing: 10) {
        Text("Default profile for: \(profile.username)")
          .bold()
          .font(.title)
        Text("Notifications: \(profile.prefersNotifications ? "On" : "Off")")
        Text("Seasonal photos: \(profile.seasonalPhoto.rawValue)")
        Text("Goal date: ") + Text(profile.goalDate, style: .date)
        Divider()
        VStack(alignment: .leading) {
          Text("Completed Badges")
            .font(.headline)
          ScrollView(.horizontal) {
            HStack {
              HikeBadge(name: "First Hike")
              HikeBadge(name: "Earth Day")
                .hueRotation(Angle(degrees: 90))
              HikeBadge(name: "Tenth Hike")
                .grayscale(0.5)
                .hueRotation(Angle(degrees: 45))
            }
            .padding(.bottom)
          }
        }
        Divider()
        VStack(alignment: .leading) {
          Text("Recent Hikes")
            .font(.headline)
          HikeView(hike: modelData.hikes.first!)
        }
      }
    }
  }
}

#Preview {
  ProfileSummary(profile: Profile.default)
    .environment(ModelData())
}
