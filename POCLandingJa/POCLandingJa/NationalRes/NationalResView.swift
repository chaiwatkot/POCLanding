//
//  NationalResViewController.swift
//  POCLandingJa
//
//  Created by CHAIWAT CHANTHASEN on 28/4/2563 BE.
//  Copyright © 2563 CHAIWAT CHANTHASEN. All rights reserved.
//

import UIKit

final class NationalResView: UIView {
  public var cellModel: [NationalResCellViewModel] = []
  
  @IBOutlet private weak var collectionView: IntrinsicSizeCollectionView!
  @IBOutlet private weak var collectionHeight: NSLayoutConstraint!
  
  override func layoutSubviews() {
    super.layoutSubviews()
    collectionHeight.constant = collectionView.contentSize.height
    collectionView.reloadData()
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setupCollectionView()
  }
  
  private func setupCollectionView() {
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.bounces = false
    collectionView.isScrollEnabled = false
    collectionView.register(nibClass: NationalResCell.self)
  }
}

extension NationalResView: UICollectionViewDelegate {
  
}

extension NationalResView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 8
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell: NationalResCell = collectionView.dequeueReusableCell(for: indexPath)
    cell.layer.cornerRadius = 15
    cell.layer.masksToBounds = true
    return cell
  }
}

extension NationalResView: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: (collectionView.frame.width - 16) / 2, height: 150)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 16
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 16
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
  }
}
