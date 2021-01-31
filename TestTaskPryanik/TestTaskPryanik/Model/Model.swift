//
//  hzModel.swift
//  TestTaskPryanik
//
//  Created by Evian on 30.01.2021.
//

import Foundation

struct MainModel : Codable {
  var data : [MainDataModel]
  var view : [String]
}

struct MainDataModel : Codable {
  var name : String
  var data : ModelData
}

struct ModelData : Codable {
  var url : String?
  var text : String?
  var selectedId : Int?
  var variants : [VariantsData]?
}

struct VariantsData : Codable {
  var id : Int
  var text : String
}


