//
//  ViewModel.swift
//  TestTaskPryanik
//
//  Created by Evian on 30.01.2021.
//

import Foundation
import UIKit

class ViewModel: NSObject {
  
  //MARK: -Properties
  @IBOutlet var dataClient : DataClient!
  
  private var data: MainModel?
  private var cellFactory = CellFactory()
  
  func fetchData(completion: @escaping() -> ()) {
    dataClient.fetchData { data in
      self.data = data
      completion()
    }
  }
  
  func numberOfItemsInSection(section: Int) -> Int {
    return data?.view.count ?? 1
  }
  
  func cellForRow(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard data != nil else { return UITableViewCell()}
    return cellFactory.createCell(for: tableView, in: (data?.view[indexPath.row])!, with: data!.data)
  }
  
  func alertForTableRow(at indexPath: IndexPath) -> UIAlertController {
    guard let name = data?.view[indexPath.row] else { return UIAlertController()}
    return AlertManager.shared.createAlert(title: "Name of this object: \(name)", subtitle: "", actionTitle: "OK")
  }
}
