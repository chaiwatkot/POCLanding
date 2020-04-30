//
//  SearchView.swift
//  POCLandingJa
//
//  Created by CHAIWAT CHANTHASEN on 29/4/2563 BE.
//  Copyright © 2563 CHAIWAT CHANTHASEN. All rights reserved.
//

import UIKit

class SearchView: UIView, ReusableView {
  
  @IBOutlet weak var textField: UITextField!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    textField.delegate = self
    textField.text = "Breakfast naja"
  }
}

extension SearchView: UITextFieldDelegate {
  
}
