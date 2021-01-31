//
//  RegistrationManager.swift
//  TestTaskPryanik
//
//  Created by Evian on 31.01.2021.
//

import Foundation
import UIKit

protocol DequeueManagerProtocol {
  func dequeueCell(from state: DataStates, for tableView: UITableView) -> CellProtocol
}

/// Dequeue reusable cell manager
struct DequeueCellManager: DequeueManagerProtocol {
  func dequeueCell(from state: DataStates, for tableView: UITableView) -> CellProtocol {
    var cell : CellProtocol!
    
    switch state {
    case .hz:
      cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifiers.Hz) as! HzCell
    case .picture:
      cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifiers.Picture) as! PictureCell
    case .selector:
      cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifiers.Selector) as! SelectorCell
    }
    return cell
  }
}
