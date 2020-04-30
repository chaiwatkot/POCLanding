//
//  ViewController.swift
//  POCLandingJa
//
//  Created by CHAIWAT CHANTHASEN on 28/4/2563 BE.
//  Copyright © 2563 CHAIWAT CHANTHASEN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet private weak var headerView: UIView!
  @IBOutlet private weak var headerHeightConstraint: NSLayoutConstraint!
  
  @IBOutlet private weak var stackView: UIStackView!
  @IBOutlet private weak var scrollViews: UIScrollView!
  @IBOutlet private weak var scrollViewTopConstraint: NSLayoutConstraint!
    
  lazy var searchController = {
    return UISearchController(searchResultsController: self)
  }()
  
  var listView: [UIView] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupNavBar()
    setupSectionView()
    setupScrollView()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
  }
    
  private func setupNavBar() {
    let searchView = SearchView.loadNib()
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
    navigationController?.navigationBar.backgroundColor = UIColor.clear
    navigationController?.navigationBar.shadowImage = UIImage()

    navigationController?.navigationBar.isTranslucent = true
    navigationController?.navigationBar.addSubview(searchView)
    
    headerHeightConstraint.constant = 100
  }
  
  private func setupScrollView() {
    scrollViews.delegate = self
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
  
  @objc private func handleMenuBar() {

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

extension ViewController: UIScrollViewDelegate {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    if scrollView.contentOffset.y > 100 {
      if headerHeightConstraint.constant > 30 {
        headerHeightConstraint.constant = headerHeightConstraint.constant - 3
      }
    } else if  scrollView.contentOffset.y < 100 {
      if headerHeightConstraint.constant < 100 {
        headerHeightConstraint.constant = headerHeightConstraint.constant + 3
      }
    }
    
    let offset: CGFloat = headerHeightConstraint.constant
    let offsetStart: CGFloat = 30
    let offsetEnd: CGFloat = 100
    let alphaCG: CGFloat
    if offset > offsetEnd {
      alphaCG = 0
    } else if offset < offsetStart {
      alphaCG = 1
    } else {
      alphaCG = (offsetEnd - offset) / (offsetEnd - offsetStart)
    }
     
    headerView.alpha = alphaCG
    
//    let transitY = scrollView.contentOffset.y * 2 / 10
//    navigationController?.navigationBar.transform = .init(translationX: 0, y: -transitY)
    
    if scrollView.contentOffset.y > 56 {
      UIView.animate(withDuration: 0.35) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
      }
    } else {
      UIView.animate(withDuration: 0.35) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
      }
    }
  }
  
}

extension ViewController: UISearchControllerDelegate {
}

extension ViewController: UISearchBarDelegate {
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    searchController.dismiss(animated: true, completion: nil)
  }
}
