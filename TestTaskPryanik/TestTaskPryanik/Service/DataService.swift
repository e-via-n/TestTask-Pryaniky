//
//  MoyaService.swift
//  TestTaskPryanik
//
//  Created by Evian on 30.01.2021.
//

import Foundation
import Alamofire
import Moya

/// Data service, using Moya
enum DataService {
  case getData
}

extension DataService: TargetType {
  var baseURL: URL { return URL(string: "https://pryaniky.com")! }
  var path: String {
    switch self {
    case .getData:
      return "/static/json/sample.json"
    }
  }
  var method: Moya.Method {
    return .get
  }
  var parameters: [String: Any]? {
    return nil
  }
  var parameterEncoding: ParameterEncoding {
    return URLEncoding.default
  }
  var sampleData: Data {
    return Data()
  }
  var headers: [String : String]? {
    return ["Content-type": "application/json"]
  }
  var task: Task {
    return .requestPlain
  }
}
