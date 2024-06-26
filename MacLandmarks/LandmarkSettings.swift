//
//  LandmarkSettings.swift
//  MacLandmarks
//
//  Created by Stanislav Romanov on 29.12.2023.
//

import SwiftUI

struct LandmarkSettings: View {
  @AppStorage("MapView.zoom")
  private var zoom: MapView.Zoom = .medium
  
  var body: some View {
    Form {
      Picker("Map Zoom", selection: $zoom) {
        ForEach(MapView.Zoom.allCases) { zoomValue in
          Text(zoomValue.rawValue)
        }
      }
      .pickerStyle(.inline)
    }
    .frame(width: 300)
    .navigationTitle("Landmark Settings")
    .padding(80)
  }
}

#Preview {
  LandmarkSettings()
}
