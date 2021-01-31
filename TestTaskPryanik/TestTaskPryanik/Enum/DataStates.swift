//
//  DataStates.swift
//  TestTaskPryanik
//
//  Created by Evian on 30.01.2021.
//

import Foundation

/// Data states enumeration, uses for creating cells,
/// depending on accepting 'Views' array
enum DataStates : String {
  case hz = "hz"
  case selector = "selector"
  case picture = "picture"
  
  init(value: String) {
    switch value {
    case "hz":
      self = .hz
    case "selector":
      self = .selector
    case "picture":
      self = .picture
    default:
      self = .hz
    }
  }
}
