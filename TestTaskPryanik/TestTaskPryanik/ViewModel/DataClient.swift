//
//  DataClient.swift
//  TestTaskPryanik
//
//  Created by Evian on 30.01.2021.
//

import UIKit
import Alamofire
import Moya

class DataClient: NSObject {
  func fetchData(completion: @escaping(MainModel) -> ()) {
    let provider = MoyaProvider<DataService>()
    
    provider.request(.getData) { event in
      switch event {
      case .success(let response):
        do {
          // parsing JSON
          let data = try JSONDecoder().decode(MainModel.self, from: response.data)
          NSLog("Parsing is success")
          completion(data)
          
        } catch let error {
          // handle parsing error
          NSLog("Parsing is failed with an error, \(error)")
        }
      case .failure(let error):
        // handle request error
        NSLog("\(error)")
      }
    }
  }
}
