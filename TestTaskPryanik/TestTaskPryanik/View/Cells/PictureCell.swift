//
//  pictureCell.swift
//  TestTaskPryanik
//
//  Created by Evian on 30.01.2021.
//

import UIKit
import Kingfisher

fileprivate struct Constants {
  static let imageViewLength : CGFloat = 100
}

class PictureCell: UITableViewCell, CellProtocol {
  
  //MARK: -Properties
  private let pictureImageView : UIImageView = {
    let imageView = UIImageView()
    return imageView
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
    pictureImageView.kf.setImage(with: URL(string: model.data.url!))
  }
  
  private func layoutCell() {
    pictureImageView.translatesAutoresizingMaskIntoConstraints = false
    addSubview(pictureImageView)
    NSLayoutConstraint.activate([
      pictureImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
      pictureImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
      pictureImageView.widthAnchor.constraint(equalToConstant: Constants.imageViewLength),
      pictureImageView.heightAnchor.constraint(equalToConstant: Constants.imageViewLength)
    ])
  }
}
