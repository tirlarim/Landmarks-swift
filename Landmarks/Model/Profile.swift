//
//  Profile.swift
//  Landmarks
//
//  Created by Stanislav Romanov on 25.12.2023.
//

import Foundation

struct Profile {
  var username: String
  var prefersNotifications: Bool
  var seasonalPhoto = Season.winter
  var goalDate = Date()
  
  static let `default` = Profile(username: "g_kumar", prefersNotifications: true)
  
  enum Season: String, CaseIterable, Identifiable {
    case spring = "🌷" // god be mercy
    case summer = "🌞"
    case autumn = "🍂"
    case winter = "☃️"
    
    var id: String { rawValue }
  }
}


