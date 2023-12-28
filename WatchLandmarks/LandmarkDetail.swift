//
//  LandmarkDetail.swift
//  WatchLandmarks
//
//  Created by Stanislav Romanov on 26.12.2023.
//

import SwiftUI

struct LandmarkDetail: View {
  @EnvironmentObject var modelData: ModelData
  var landmark: Landmark
  
  var landmarkIndex: Int {
    modelData.landmarks.firstIndex(where: {$0.id == landmark.id})!
  }
  
  var body: some View {
    ScrollView {
      VStack {
        CircleImage(pic: landmark.image.resizable())
          .scaledToFit()
        Text(landmark.name)
          .font(.headline)
          .lineLimit(0)
        Toggle(isOn: $modelData.landmarks[landmarkIndex].isFavorite, label: {Text("Favorite")})
        Divider()
        Text(landmark.park)
          .font(.caption)
          .bold()
          .lineLimit(0)
        Text(landmark.state)
          .font(.caption)
        Divider()
        MapView(coordinate: landmark.locationCoordinate) // fuck yeah maps in watch
          .cornerRadius(5.0)
          .scaledToFit()
      }
      .padding(16)
    }
    .navigationTitle("Landmarks")
  }
}

struct LandmarkDetail_Previews: PreviewProvider {
  static let modelData = ModelData()
  static var previews: some View {
    LandmarkDetail(landmark: modelData.landmarks[0])
      .environmentObject(modelData)
  }
}
