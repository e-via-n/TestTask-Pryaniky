//
//  hzCell.swift
//  TestTaskPryanik
//
//  Created by Evian on 30.01.2021.
//

import UIKit

fileprivate struct Constants {
  static let labelOffser : CGFloat = 5
}

class HzCell: UITableViewCell, CellProtocol {
  
  //MARK: -Properties
  private let blockTextLabel: UILabel  = {
    let label = UILabel()
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 23, weight: .thin)
    return label
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    layoutCell()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: -Setup
  public func setupCell(model: MainDataModel) {
    blockTextLabel.text = model.data.text
  }
  
  private func layoutCell() {
    blockTextLabel.translatesAutoresizingMaskIntoConstraints = false
    addSubview(blockTextLabel)
    NSLayoutConstraint.activate([
      blockTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.labelOffser),
      blockTextLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.labelOffser),
      blockTextLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.labelOffser),
      blockTextLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.labelOffser)
    ])
  }
}
