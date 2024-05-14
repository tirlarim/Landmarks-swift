//
//  ContentView.swift
//  MacLandmarks
//
//  Created by Stanislav Romanov on 28.12.2023.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    LandmarkList()
      .frame(minWidth: 800, minHeight: 600)
  }
}

#Preview {
  ContentView()
    .environment(ModelData())
}
