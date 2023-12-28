//
//  NotificationController.swift
//  WatchLandmarks
//
//  Created by Stanislav Romanov on 26.12.2023.
//

import WatchKit
import SwiftUI
import UserNotifications


class NotificationController: WKUserNotificationHostingController<NotificationView> {
  var title: String?
  var message: String?
  var landmark: Landmark?
  
  let landmarkIndexKey: String = "landmarkIndex"

  override var body: NotificationView {
    NotificationView(
      title: title,
      message: message,
      landmark: landmark)
  }
  
  override func didReceive(_ notification: UNNotification) {
    let modelData: ModelData = ModelData()
    let notificationData = notification.request.content.userInfo as? [String: Any]
    
    let aps = notificationData?["aps"] as? [String: Any]
    let alert = aps?["alert"] as? [String: Any]
    
    title = alert?["title"] as? String
    message = alert?["body"] as? String
    
    if let index = notificationData?[landmarkIndexKey] as? Int {
      landmark = modelData.landmarks[index]
    }
  }
}






