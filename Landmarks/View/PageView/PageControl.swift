//
//  PageControl.swift
//  Landmarks
//
//  Created by Stanislav Romanov on 26.12.2023.
//

import SwiftUI
import UIKit

struct PageControl: UIViewRepresentable {
  @Binding var currentPage: Int
  var numberOfpages: Int
  
  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }
  
  func makeUIView(context: Context) -> UIPageControl {
    let control = UIPageControl()
    control.numberOfPages = numberOfpages
    control.addTarget(context.coordinator,
                      action: #selector(Coordinator.updateCurrentPage(seender:)),
                      for: .valueChanged)
    return control
  }
  
  func updateUIView(_ uiView: UIPageControl, context: Context) {
    uiView.currentPage = currentPage
  }
  
  class Coordinator: NSObject {
    var control: PageControl
    
    init(_ control: PageControl) {
      self.control = control
    }
    
    @objc
    func updateCurrentPage(seender: UIPageControl) {
      control.currentPage = seender.currentPage
    }
  }
}
