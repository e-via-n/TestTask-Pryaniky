//
//  CustomPickerView.swift
//  TestTaskPryanik
//
//  Created by Evian on 31.01.2021.
//

import Foundation
import UIKit

class CustomPickerViewDelegate: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
  private var data: [VariantsData]!
  private var arrOfId : [Int] = []
  private var arrOfText : [String] = []
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return arrOfText.count
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return "\(arrOfText[row]), id: \(arrOfId[row])"
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    NSLog("selected element with id: \(arrOfId[row]), and name: \(arrOfText[row])")
  }
  
  private func compareData(data: [VariantsData]) {
    for item in data {
      arrOfId.append(item.id)
      arrOfText.append(item.text)
    }
  }
  
  init(data: [VariantsData]) {
    super.init()
    self.data = data
    compareData(data: data)
  }
}
