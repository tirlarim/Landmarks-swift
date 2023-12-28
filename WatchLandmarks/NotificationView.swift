//
//  NotificationView.swift
//  WatchLandmarks Watch App
//
//  Created by Stanislav Romanov on 26.12.2023.
//

import SwiftUI

struct NotificationView: View {
  var title: String?
  var message: String?
  var landmark: Landmark?
  
  var body: some View {
    VStack {
      if landmark != nil {
        CircleImage(pic: landmark!.image.resizable())
          .scaledToFit()
      }
      Text(title ?? "Unknown Landmark")
        .font(.headline)
      Divider()
      Text(message ?? "You are within 5 miles of one of your favorite landmarks.")
        .font(.caption)
    }
  }
}

struct NotificationView_Previews: PreviewProvider {
  static var previews: some View {
    NotificationView(
     title: "Landmark Title",
//     message: "message example",
     message: "message long long long long long long long long long long long long",
     landmark: ModelData().landmarks.first
    )
  }
}
