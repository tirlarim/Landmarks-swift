//
//  PageView.swift
//  Landmarks
//
//  Created by Stanislav Romanov on 26.12.2023.
//

import SwiftUI

struct PageView<Page: View>: View {
  @State private var currentPageIndex: Int = 0
  var pages: [Page]
  
  var body: some View {
    ZStack(alignment: .bottomLeading) {
      PageViewController(currentPageIndex: $currentPageIndex, pages: pages)
        .aspectRatio(3/2, contentMode: .fit)
      PageControl(currentPage: $currentPageIndex, numberOfpages: pages.count)
//        .frame(width: CGFloat(pages.count * 18))
//        .padding(.trailing)
    }
  }
}

struct PageView_Previews: PreviewProvider {
  static var previews: some View {
    PageView(pages: ModelData().features.map{FeatureCard(landmark: $0)})
  }
}
