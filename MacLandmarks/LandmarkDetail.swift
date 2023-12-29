//
//  LandmarkDetail.swift
//  MacLandmarks
//
//  Created by Stanislav Romanov on 28.12.2023.
//

import SwiftUI
import MapKit

struct LandmarkDetail: View {
  @EnvironmentObject var modelData: ModelData
  var landmark: Landmark
  var landmarkIndex: Int {
    ModelData().landmarks.firstIndex(where: {$0.id == landmark.id})!
  }
  
  var body: some View {
    ScrollView {
      ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
        MapView(coordinate: landmark.locationCoordinate)
          .frame(height: 200)
        
        Button("Open in Maps") {
          let destination = MKMapItem(placemark: MKPlacemark(coordinate: landmark.locationCoordinate))
          destination.name = landmark.name
          destination.openInMaps()
        }
        .padding()
      }

      VStack(alignment: .leading, spacing: 20) {
        HStack(spacing: 24) {
          CircleImage(pic: landmark.image.resizable())
            .frame(width: 160.0, height: 160.0)
          VStack(alignment: .leading) {
            HStack {
              Text(landmark.name)
                .font(.title)
              FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                .buttonStyle(.plain)
            }
            VStack(alignment: .leading) {
              Text(landmark.park)
              Text(landmark.state)
            }
            .font(.subheadline)
            .foregroundStyle(.secondary)
          }
        }
        Divider()
        Text("About \(landmark.name)")
          .font(.title2)
        Text(landmark.description)
      }
      .padding()
      .frame(maxWidth: 700)
      .offset(y: -50)
    }
    .navigationTitle(landmark.name)
  }
}

struct LandmarkDetailMac_Previews: PreviewProvider {
  static var previews: some View {
    let modelData = ModelData()
    LandmarkDetail(landmark: modelData.landmarks[0])
      .environmentObject(modelData)
      .frame(width: 850, height: 700)
  }
}
