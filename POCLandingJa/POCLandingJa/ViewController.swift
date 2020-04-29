//
//  ViewController.swift
//  POCLandingJa
//
//  Created by CHAIWAT CHANTHASEN on 28/4/2563 BE.
//  Copyright © 2563 CHAIWAT CHANTHASEN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet private weak var stackView: UIStackView!
  
  var listView: [UIView] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupSectionView()
  }

  private func setupSectionView() {
    let datas = LandingModel.mockData().sorted { (cell1, cell2) -> Bool in
      cell1.sortSquence < cell2.sortSquence
    }
    for data in datas {
      guard let sectionView = checkTypeView(typeView: data.typeSectionList) else { return }
      listView.append(sectionView)
    }
    
    setupStackView()
  }
  
  private func setupStackView() {
    for view in listView {
      stackView.addArrangedSubview(view)
    }
  }
  
  private func checkTypeView(typeView: TypeSectionList) -> UIView? {
    if let suggestModels = typeView.suggestResModels {
      let suggestionResView = SuggestionResView.loadNib()
      return suggestionResView
    } else if let adsModels = typeView.adsResModels {
      let adsResView = AdsResView.loadNib()
      return adsResView
    } else if let nearyModels = typeView.nearyResModels {
      let nearyResView = NearyResView.loadNib()
      return nearyResView
    } else if let categoryModels = typeView.categoryResModels {
      let categoryResView = CategoryResView.loadNib()
      return categoryResView
    } else if let nationalModels = typeView.nationalResModels {
      let nationalResView = NationalResView.loadNib()
      return nationalResView
    }
    return nil
  }
}

