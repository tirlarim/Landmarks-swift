//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Stanislav Romanov on 24.12.2023.
//

import SwiftUI

struct LandmarkDetail: View {
  @Environment(ModelData.self) var modelData
  var landmark: Landmark
  
  var landmarkIndex: Int {
    ModelData().landmarks.firstIndex(where: {$0.id == landmark.id})!
  }
  
  var body: some View {
    @Bindable var modelData = modelData
    ScrollView {
      MapView(coordinate: landmark.locationCoordinate)
        .frame(height: 300)
      CircleImage(pic: landmark.image)
        .offset(y: -130)
        .padding(.bottom, -130)
      VStack(alignment: .leading) {
        HStack {
          Text(landmark.name)
            .font(.title)
          FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
        }
        HStack {
          Text(landmark.park)
          Spacer();
          Text(landmark.state)
        }
        .font(.subheadline)
        .foregroundStyle(.secondary)
        Divider()
        Text("About \(landmark.name)")
          .font(.title2)
        Text(landmark.description)
      }
      .padding()
      Spacer()
    }
    .navigationTitle(landmark.name)
    .navigationBarTitleDisplayMode(.inline)
  }
}

#Preview {
  let modelData = ModelData()
  return LandmarkDetail(landmark: modelData.landmarks[0])
    .environment(modelData)
}
