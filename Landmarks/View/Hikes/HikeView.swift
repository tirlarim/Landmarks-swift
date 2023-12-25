//
//  HikeView.swift
//  Landmarks
//
//  Created by Stanislav Romanov on 23.12.2023.
//

import SwiftUI


extension AnyTransition {
  static var moveAndFade: AnyTransition {
    .asymmetric(insertion: .move(edge: .trailing).combined(with: .opacity),
                removal: .scale.combined(with: .opacity))
  }
}

struct HikeView: View {
  var hike: Hike
  @State private var showDetail: Bool = true
  
  var body: some View {
    VStack {
      HStack {
        HikeGraph(hike: hike, path: \.elevation)
          .frame(width: 50, height: 30)
        
        VStack(alignment: .leading) {
          Text(hike.name)
            .font(.headline)
          Text(hike.distanceText)
        }
        
        Spacer()
        
        Button {
          withAnimation {
            showDetail.toggle()
          }
        } label: {
          Label("Graph", systemImage: "chevron.right.circle")
            .labelStyle(.iconOnly)
            .imageScale(.large)
            .padding()
            .rotationEffect(.degrees(showDetail ? 90 : 0))
            .scaleEffect(showDetail ? 1.5 : 1.0)
        }
      }
      
      if showDetail {
        HikeDetail(hike: hike)
          .transition(.moveAndFade)
      }
    }
  }
}

struct HikeView_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      HikeView(hike: ModelData().hikes[0])
        .padding()
      Spacer()
    }
  }
}
