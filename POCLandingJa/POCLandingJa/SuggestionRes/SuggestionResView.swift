//
//  SuggestionResViewController.swift
//  POCLandingJa
//
//  Created by CHAIWAT CHANTHASEN on 28/4/2563 BE.
//  Copyright © 2563 CHAIWAT CHANTHASEN. All rights reserved.
//

import UIKit

class SuggestionResView: UIView {
  public var cellModels: [SuggestionResCellViewModel] = []
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setupCollectionView()
  }
  
  private func setupCollectionView() {
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.register(nibClass: SuggestionResCell.self)
  }
  
  public func updateUI(cellModels: [SuggestionResCellViewModel]) {
    self.cellModels = cellModels
    collectionView.reloadData()
  }
}

extension SuggestionResView: UICollectionViewDelegate {
  
}

extension SuggestionResView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return cellModels.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell: SuggestionResCell = SuggestionResCell.loadNib()
    return cell
  }
}

