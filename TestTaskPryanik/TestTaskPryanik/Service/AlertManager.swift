//
//  AlertManager.swift
//  TestTaskPryanik
//
//  Created by Evian on 31.01.2021.
//

import Foundation
import UIKit

/// Singletone class, for creating UIAlertControllers
class AlertManager {
  static let shared = AlertManager()
  
  func createAlert(title: String, subtitle: String, actionTitle: String, action: (()->Void)? = nil) -> UIAlertController {
    let alert = UIAlertController(title: title, message: subtitle, preferredStyle: .alert)
    let action = UIAlertAction(title: actionTitle, style: .default) { (_) in
      if let action = action {
        action()
      }
    }
    alert.addAction(action)
    return alert
  }
}
