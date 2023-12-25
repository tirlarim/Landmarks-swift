//
//  Hike.swift
//  Landmarks
//
//  Created by Stanislav Romanov on 24.12.2023.
//

import Foundation

struct Hike: Hashable, Codable, Identifiable {
  var id: Int
  var name: String
  var distance: Double
  var difficulty: Int
  var observations: [Observation]
  
  static var forrmater = LengthFormatter()
  
  var distanceText: String {
    Hike.forrmater.string(fromValue: distance, unit: .kilometer)
  }
  
  struct Observation: Hashable, Codable {
    var distanceFromStart: Double
    var elevation: Range<Double>
    var pace: Range<Double>
    var heartRate: Range<Double>
  }
}


