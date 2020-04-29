//
//  ViewController.swift
//  POCLandingJa
//
//  Created by CHAIWAT CHANTHASEN on 28/4/2563 BE.
//  Copyright © 2563 CHAIWAT CHANTHASEN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    testAddSubView()
  }

  
  func testAddSubView() {
    let view1 = UIView()
    view1.frame.size = CGSize(width: view.frame.width, height: 300)
    view1.backgroundColor = UIColor.green
    
    let view2 = UIView()
    view2.frame.size = CGSize(width: view.frame.width, height: 300)
    view2.backgroundColor = UIColor.blue

    let stackView = UIStackView(arrangedSubviews: [view1, view2])
    stackView.contentMode = .scaleAspectFit
    stackView.spacing = 50
    stackView.axis = .vertical
    stackView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
    stackView.backgroundColor = UIColor.red
    
    view.addSubview(stackView)
    stackView.sizeToFit()
  }
}

