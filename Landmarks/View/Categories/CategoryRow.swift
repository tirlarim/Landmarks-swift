//
//  CategoryRow.swift
//  Landmarks
//
//  Created by Stanislav Romanov on 25.12.2023.
//

import SwiftUI

struct CategoryRow: View {
  var categoryName: String
  var items: [Landmark]
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(categoryName)
        .font(.headline)
        .padding(.leading, 15)
        .padding(.top, 5)
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(alignment: .top, spacing: 0.0) {
          ForEach(items) { item in
            NavigationLink {
              LandmarkDetail(landmark: item)
            } label: {
              CategoryItem(landmark: item)
            }
          }
        }
      }
      .frame(height: 185.0)
    }
  }
}

#Preview {
  let landmarks = ModelData().landmarks
  return CategoryRow(categoryName: landmarks[0].category.rawValue,
              items: Array(landmarks.prefix(3)))
}
