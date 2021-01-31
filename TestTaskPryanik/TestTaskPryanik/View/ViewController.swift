//
//  ViewController.swift
//  TestTaskPryanik
//
//  Created by Evian on 30.01.2021.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet var tableView: UITableView!
  @IBOutlet weak var viewModel: ViewModel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(HzCell.self, forCellReuseIdentifier: ReuseIdentifiers.Hz)
    tableView.register(PictureCell.self, forCellReuseIdentifier: ReuseIdentifiers.Picture)
    tableView.register(SelectorCell.self, forCellReuseIdentifier: ReuseIdentifiers.Selector)
    
    viewModel.fetchData {
      self.tableView.reloadData()
    }
  }
}

//MARK: -Table view data source
extension ViewController: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfItemsInSection(section: section)
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return viewModel.cellForRow(tableView, cellForRowAt: indexPath)
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return GlobalConstants.cellHeight
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    present(viewModel.alertForTableRow(at: indexPath), animated: true, completion: nil)
  }
}


