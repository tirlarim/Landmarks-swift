//
//  CircleImage.swift
//  Landmarks
//
//  Created by Stanislav Romanov on 23.12.2023.
//

import SwiftUI

struct CircleImage: View {
  var pic: Image
  
  var body: some View {
    pic
      .clipShape(Circle())
      .overlay {
        Circle().stroke(.white, lineWidth: 4)
      }
      .shadow(radius: 7)
  }
}

#Preview {
  CircleImage(pic: Image("turtlerock"))
}
