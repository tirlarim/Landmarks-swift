//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Stanislav Romanov on 24.12.2023.
//

import SwiftUI

struct LandmarkList: View {
  @Environment(ModelData.self) var modelData
  @State private var showFavoritesOnly = false
  @State private var currentFilter = FilterCategory.all
  @State private var selectedLandmark: Landmark?
  
  enum FilterCategory: String, CaseIterable, Identifiable {
    case all = "All"
    case lakes = "Lakes"
    case rivers = "Rivers"
    case mountains = "Mountains"
    var id: FilterCategory{self}
  }
  
  var filteredLandmarks: [Landmark] {
    modelData.landmarks.filter { landmark in
      (!showFavoritesOnly || landmark.isFavorite) &&
      (currentFilter == .all || landmark.category.rawValue == currentFilter.rawValue)
    }
  }
  
  var index: Int? {
    modelData.landmarks.firstIndex(where: { $0.id == selectedLandmark?.id })
  }
  
  var title: String {
    let title = currentFilter == .all ? "Landmarks" : currentFilter.rawValue
    return showFavoritesOnly ? "Favorute \(title)" : title
  }
  
  var body: some View {
    @Bindable var modelData = modelData
    if #available(macOS 13.0, *) {
      NavigationSplitView {
        LandmarkListView
      } detail: {
        Text("Select a Landmark")
      }
    } else {
      NavigationView {
        LandmarkListView
        Text("Select a Landmark")
      }
      .focusedValue(\.selectedLandmark, $modelData.landmarks[index ?? 0])
    }
  }
  
  private var LandmarkListView: some View {
    List(selection: $selectedLandmark) {
      ForEach(filteredLandmarks) { item in
        NavigationLink {
          LandmarkDetail(landmark: item)
        } label: {
          LandmarkRow(landmark: item)
        }
        .tag(item)
      }
    }
    .animation(.default, value: filteredLandmarks)
    .navigationTitle(title)
    .frame(minWidth: 300)
    .toolbar {
      ToolbarItem {
        Menu {
          Picker("Category", selection: $currentFilter) {
            ForEach(FilterCategory.allCases) { category in
              Text(category.rawValue).tag(category)
            }
          }
          .pickerStyle(.inline)
          Toggle(isOn: $showFavoritesOnly) {
            Label("Favorites only", systemImage: "star.fill")
          }
        } label: {
          Label("Filter", systemImage: "slider.horizontal.3")
        }
      }
    }
  }
}

#Preview {
  ContentView()
    .environment(ModelData())
}
