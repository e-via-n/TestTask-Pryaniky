//
//  DataCase.swift
//  TestTaskPryanik
//
//  Created by Evian on 30.01.2021.
//

import Foundation
import UIKit

protocol CellFactoryProtocol {
  mutating func createCell(for tableView: UITableView, in order: String, with data: [MainDataModel]) -> UITableViewCell
}

protocol CellProtocol {
  func setupCell(model: MainDataModel)
}

struct CellFactory: CellFactoryProtocol {
  private var dequeueManager = DequeueCellManager() 
  private var dataSelector = DataSelector()
  
  mutating func createCell(for tableView: UITableView, in order: String, with data: [MainDataModel]) -> UITableViewCell {
    let dataState = DataStates(rawValue: order)!
    
    let cell = dequeueManager.dequeueCell(from: dataState, for: tableView)
    
    cell.setupCell(model: dataSelector.selectData(for: dataState, with: data))
    return cell as! UITableViewCell
  }
}
