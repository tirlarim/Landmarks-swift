//
//  HikeBadge.swift
//  Landmarks
//
//  Created by Stanislav Romanov on 25.12.2023.
//

import SwiftUI

struct HikeBadge: View {
  var name: String
  private let size: CGPoint = CGPoint(x: 300, y: 300)
  
  var body: some View {
    VStack(alignment: .center) {
      Badge()
        .frame(width: size.x, height: size.y)
        .scaleEffect(1.0 / 3.0)
        .frame(width: size.x / 3.0, height: size.y / 3.0)
      Text(name)
        .font(.caption)
        .accessibilityLabel("Badge for \(name).")
    }
  }
}

#Preview {
  HikeBadge(name: "Lorem ipsum dolor sit amet")
}
