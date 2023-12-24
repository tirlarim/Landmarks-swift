//
//  MapView.swift
//  Landmarks
//
//  Created by Stanislav Romanov on 23.12.2023.
//

import SwiftUI
import MapKit

struct MapView: View {
  var coordinate: CLLocationCoordinate2D
  private var region: MKCoordinateRegion {
    MKCoordinateRegion(
      center: coordinate,
      span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
  }
  
  var body: some View {
    Map(coordinateRegion: .constant(region))
  }
}

struct MapView_Previews: PreviewProvider {
  static var previews: some View {
    MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
  }
}
