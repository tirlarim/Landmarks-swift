//
//  LandmarkList.swift
//  WatchLandmarks
//
//  Created by Stanislav Romanov on 28.12.2023.
//

import SwiftUI

struct LandmarkList: View {
  @Environment(ModelData.self) var modelData
  @State private var showFavoritesOnly = false
  
  var filteredLandmarks: [Landmark] {
    modelData.landmarks.filter { landmark in
      (!showFavoritesOnly || landmark.isFavorite)
    }
  }
  
  var body: some View {
    NavigationSplitView {
      List {
        Toggle(isOn: $showFavoritesOnly) {
          Text("Favorites only")
        }
        ForEach(filteredLandmarks) { item in
          NavigationLink {
            LandmarkDetail(landmark: item)
          } label: {
            LandmarkRow(landmark: item)
          }
        }
      }
      .animation(.default, value: filteredLandmarks)
      .navigationTitle("Landmarks")
    } detail: {
      Text("Select a Landmark")
    }
  }
}



#Preview {
  LandmarkList()
    .environment(ModelData())
}
