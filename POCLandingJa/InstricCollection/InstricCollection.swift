//
//  InstricCollection.swift
//  POCLandingJa
//
//  Created by CHAIWAT CHANTHASEN on 30/4/2563 BE.
//  Copyright © 2563 CHAIWAT CHANTHASEN. All rights reserved.
//

import Foundation
import UIKit

class IntrinsicSizeCollectionView: UICollectionView {
//  override var contentSize: CGSize {
//    didSet {
//      invalidateIntrinsicContentSize()
//    }
//  }
//
//  override var intrinsicContentSize: CGSize {
//    layoutIfNeeded()
//    return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
//  }
  
  override func layoutSubviews() {
      super.layoutSubviews()
      if !self.bounds.size.equalTo(self.intrinsicContentSize) {
          self.invalidateIntrinsicContentSize()
      }
  }

  override var intrinsicContentSize: CGSize {
      get {
          let intrinsicContentSize = self.contentSize
          return intrinsicContentSize
      }
  }


}

