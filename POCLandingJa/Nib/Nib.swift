//
//  Nib.swift
//  POCLandingJa
//
//  Created by CHAIWAT CHANTHASEN on 29/4/2563 BE.
//  Copyright © 2563 CHAIWAT CHANTHASEN. All rights reserved.
//

import UIKit

// MARK: - Nib Loading

public protocol NibLoadableView: class {
  static var nibName: String { get }
}

public extension NibLoadableView where Self: UIView {
  static var nibName: String {
    return String(describing: self)
  }
}

public extension NibLoadableView {
  static private func bundle() -> Bundle {
    let bundle = Bundle(for: Self.self)
    return bundle
  }

  static fileprivate func nib() -> UINib {
    let nibName = Self.nibName
    let nib = UINib(nibName: nibName, bundle: bundle())
    return nib
  }
  
  static func loadNib(owner: UIView? = nil) -> Self {
    guard let classes = nib().instantiate(withOwner: owner, options: nil).first as? Self else {
      fatalError("Could not loadNib \(Self.nibName)")
    }
    return classes
  }
    
  static func instanceFromNib() -> UIView {
    guard let view = nib().instantiate(withOwner: self, options: nil).first as? UIView else {
      fatalError("Could not instanceFromNib \(Self.nibName)")
    }
    return view
  }
}

extension UIView: NibLoadableView { }

// MARK: - Cell Reuse

// Apply this protocol to any UIView descendant
public protocol ReusableView: class {
  static var defaultReuseIdentifier: String { get }
}

public extension ReusableView where Self: UIView {
  static var defaultReuseIdentifier: String {
    return String(describing: self)
  }
}

// MARK: Cell Reuse for UICollectionView

public extension UICollectionView {
  
  func register<T: UICollectionViewCell>(class: T.Type)
    where T: ReusableView {
    register(T.self, forCellWithReuseIdentifier: T.defaultReuseIdentifier)
  }
  
  func register<T: UICollectionViewCell>(nibClass: T.Type)
    where T: ReusableView {
    register(T.nib(), forCellWithReuseIdentifier: T.defaultReuseIdentifier)
  }
  
  func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T
    where T: ReusableView {
      
    guard let cell = dequeueReusableCell(withReuseIdentifier: T.defaultReuseIdentifier,
                                         for: indexPath) as? T
      else {
      fatalError("Could not dequeue cell \(T.self) with identifier \(T.defaultReuseIdentifier)")
    }
    
    return cell
  }
}

// MARK: Cell Reuse for UITableView

public extension UITableView {
  
  /// Register cell with automatically setting Identifier
  func register<T: UITableViewCell>(cellClass: T.Type)
    where T: ReusableView {
    register(T.self, forCellReuseIdentifier: T.defaultReuseIdentifier)
  }

  func register<T: UITableViewCell>(nibCellClass: T.Type)
    where T: ReusableView {
    register(T.nib(), forCellReuseIdentifier: T.defaultReuseIdentifier)
  }

  func register<T: UITableViewHeaderFooterView>(headerFooterClass: T.Type)
    where T: ReusableView {
      register(T.self, forHeaderFooterViewReuseIdentifier: T.defaultReuseIdentifier)
  }
  
  func register<T: UITableViewHeaderFooterView>(nibHeaderFooterClass: T.Type)
    where T: ReusableView {
    register(T.nib(), forHeaderFooterViewReuseIdentifier: T.defaultReuseIdentifier)
  }

  /// Get cell with the default reuse identifier
  func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T
    where T: ReusableView {
      
    guard let cell = dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier,
                                         for: indexPath) as? T
      else {
      fatalError("Could not dequeue cell \(T.self) with identifier \(T.defaultReuseIdentifier)")
    }
    
    return cell
  }
  
  /// Get header/footer with the default reuse identifier
  func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T
    where T: ReusableView {
      
    guard let cell = dequeueReusableHeaderFooterView(withIdentifier: T.defaultReuseIdentifier) as? T
      else {
        fatalError("Could not dequeue header/footer \(T.self) with identifier \(T.defaultReuseIdentifier)")
    }
    
    return cell
  }
}
