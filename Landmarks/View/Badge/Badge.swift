//
//  Badge.swift
//  Landmarks
//
//  Created by Stanislav Romanov on 24.12.2023.
//

import SwiftUI

struct Badge: View {
  var badgeSymbols: some View {
    ForEach (0..<8) { index in
      BadgeSymbol()
        .padding(-60)
        .rotationEffect(Angle(degrees: Double(index) * (360.0 / 8.0)), anchor: .bottom)
    }
    .opacity(0.5)
  }
  
  var body: some View {
    ZStack {
      BadgeBackground()
      GeometryReader { geometry in
        badgeSymbols
          .scaleEffect(1.0/4.0, anchor: .top)
          .position(
            x: geometry.size.width / (2.0),
            y: geometry.size.height * (3.0 / 4.0))
      }
    }
    .scaledToFit()
  }
}

struct Badge_Previews: PreviewProvider {
  static var previews: some View {
    Badge()
  }
}
