//
//  DataSelectionManager.swift
//  TestTaskPryanik
//
//  Created by Evian on 31.01.2021.
//

import Foundation

protocol DataSelectorProtocol {
  mutating func selectData(for state: DataStates, with data: [MainDataModel]) -> MainDataModel
}

/// Selects the data
struct DataSelector: DataSelectorProtocol {
  private var mainDataModel: MainDataModel!
  
  mutating func selectData(for state: DataStates, with data: [MainDataModel]) -> MainDataModel {
    for item in data {
      if item.name == state.rawValue {
        self.mainDataModel = item
      }
    }
    return mainDataModel
  }
}
