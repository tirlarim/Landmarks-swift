//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Stanislav Romanov on 24.12.2023.
//

import SwiftUI

struct LandmarkRow: View {
  var landmark: Landmark
  
  var body: some View {
    HStack {
      landmark.image
        .resizable()
        .frame(width: 50, height: 50)
        .cornerRadius(5)
      VStack(alignment: .leading) {
        Text(landmark.name)
          .bold()
#if !os(watchOS)
        Text(landmark.park)
          .font(.caption)
          .foregroundStyle(.secondary)
#endif
      }
      Spacer()
      if landmark.isFavorite {
        Image(systemName: "star.fill")
          .foregroundColor(.yellow)
      }
    }
    .padding(.vertical, 4)
  }
}

struct LandmarkRow_Previews: PreviewProvider {
  static var previews: some View {
    let landmarks = ModelData().landmarks
    Group {
      LandmarkRow(landmark: landmarks[0])
      List(landmarks) { landmark in
        LandmarkRow(landmark: landmark)
      }
    }
  }
}
