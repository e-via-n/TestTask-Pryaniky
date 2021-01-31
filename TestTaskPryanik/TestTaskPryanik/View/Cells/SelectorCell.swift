//
//  selectorCell.swift
//  TestTaskPryanik
//
//  Created by Evian on 30.01.2021.
//

import UIKit

class SelectorCell: UITableViewCell, CellProtocol {
  
  //MARK: -Properties
  private var selectorPickerView = UIPickerView()
  private var customPickerDelegate : CustomPickerViewDelegate?
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    layoutCell()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: -Setup
  public func setupCell(model: MainDataModel) {
    guard let selectedId = model.data.selectedId else { return }
    guard let modelData = model.data.variants else { return }
    
    customPickerDelegate = CustomPickerViewDelegate(data: modelData)
    selectorPickerView.delegate = customPickerDelegate
    selectorPickerView.dataSource = customPickerDelegate
    selectorPickerView.selectRow(selectedId - 1, inComponent: 0, animated: true)
  }
  
  private func layoutCell() {
    selectorPickerView.translatesAutoresizingMaskIntoConstraints = false
    self.contentView.addSubview(selectorPickerView)
    NSLayoutConstraint.activate([
      selectorPickerView.centerXAnchor.constraint(equalTo: centerXAnchor),
      selectorPickerView.centerYAnchor.constraint(equalTo: centerYAnchor),
      selectorPickerView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1),
      selectorPickerView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1/3)
    ])
  }
}
