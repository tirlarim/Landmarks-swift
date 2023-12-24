//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by Stanislav Romanov on 24.12.2023.
//

import SwiftUI

struct FavoriteButton: View {
  @Binding var isSet: Bool
  
  var body: some View {
    Button {
      isSet.toggle()
    } label: {
      Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
        .labelStyle(.iconOnly)
        .foregroundStyle(isSet ? .yellow : .gray)
    }
  }
}

struct FavoriteButton_Previews: PreviewProvider {
  static var previews: some View {
    FavoriteButton(isSet: .constant(true))
  }
}
