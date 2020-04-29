//
//  LandingModel.swift
//  POCLandingJa
//
//  Created by CHAIWAT CHANTHASEN on 29/4/2563 BE.
//  Copyright © 2563 CHAIWAT CHANTHASEN. All rights reserved.
//

import Foundation

public struct LandingModel {
  var landingSectionList: [RestaurantCellModels]
  
  init(landingSectionList: [RestaurantCellModels]) {
    self.landingSectionList = landingSectionList
  }
  
  static func mockData() -> [RestaurantCellModels] {
    let suggestResModel = SuggestionResCellViewModel(title: "", imagePath: "")
    let adsResModel = AdsResCellViewModel(title: "", imagePath: "")
    let nearyResModel = NearyResCellViewModel(title: "", imagePath: "")
    let categoryResModel = CategoryResCellViewModel(title: "", imagePath: "")
    let nationalResModel = NationalResCellViewModel(title: "", imagePath: "")
    
    return [RestaurantCellModels(sortSquence: 5,
                                 typeSectionList: TypeSectionList(suggestResModels: [suggestResModel, suggestResModel, suggestResModel, suggestResModel, suggestResModel],
                                                                  adsResModels: nil,
                                                                  nearyResModels: nil,
                                                                  categoryResModels: nil,
                                                                  nationalResModels: nil)),
            RestaurantCellModels(sortSquence: 4,
                                 typeSectionList: TypeSectionList(suggestResModels: nil,
                                                                  adsResModels: [adsResModel, adsResModel, adsResModel, adsResModel, adsResModel],
                                                                  nearyResModels: nil,
                                                                  categoryResModels: nil,
                                                                  nationalResModels: nil)),
            RestaurantCellModels(sortSquence: 3,
                                 typeSectionList: TypeSectionList(suggestResModels: nil,
                                                                  adsResModels: nil,
                                                                  nearyResModels: [nearyResModel, nearyResModel, nearyResModel, nearyResModel, nearyResModel],
                                                                  categoryResModels: nil,
                                                                  nationalResModels: nil)),
            RestaurantCellModels(sortSquence: 2,
                                 typeSectionList: TypeSectionList(suggestResModels: nil,
                                                                  adsResModels: nil,
                                                                  nearyResModels: nil,
                                                                  categoryResModels: [categoryResModel, categoryResModel, categoryResModel, categoryResModel, categoryResModel],
                                                                  nationalResModels: nil)),
            RestaurantCellModels(sortSquence: 1,
                                 typeSectionList: TypeSectionList(suggestResModels: nil,
                                                                  adsResModels: nil,
                                                                  nearyResModels: nil,
                                                                  categoryResModels: nil,
                                                                  nationalResModels: [nationalResModel, nationalResModel, nationalResModel, nationalResModel, nationalResModel]))]
  }
}

public struct RestaurantCellModels {
  let sortSquence: Int
  let typeSectionList: TypeSectionList
  
  init(sortSquence: Int, typeSectionList: TypeSectionList) {
    self.sortSquence = sortSquence
    self.typeSectionList = typeSectionList
  }
}

public struct TypeSectionList {
  let suggestResModels: [SuggestionResCellViewModel]?
  let adsResModels: [AdsResCellViewModel]?
  let nearyResModels: [NearyResCellViewModel]?
  let categoryResModels: [CategoryResCellViewModel]?
  let nationalResModels: [NationalResCellViewModel]?
 
  init(suggestResModels: [SuggestionResCellViewModel]?, adsResModels: [AdsResCellViewModel]?, nearyResModels: [NearyResCellViewModel]?, categoryResModels: [CategoryResCellViewModel]?, nationalResModels: [NationalResCellViewModel]?) {
    self.suggestResModels = suggestResModels
    self.adsResModels = adsResModels
    self.nearyResModels = nearyResModels
    self.categoryResModels = categoryResModels
    self.nationalResModels = nationalResModels
  }
}
