//
//  UICollectionViewFlowLayout+createColumnsFlowLayout.swift
//  MovieApp
//
//  Created by ahmad on 06/07/2023.
//

import UIKit

extension UICollectionViewFlowLayout {
  ///  function takes a view and columns parameter and returns a UICollectionViewFlowLayout object that is configured for a three-column layout.
  /// - Parameters:
  ///   - view: the view that we will be
  ///   - columns: the number of cells you need to present in the same row
  /// - Returns: UICollectionViewFlowLayout
  func createThreeColumnFlowLayout(to view: UIView ,withColumn columns:Int) -> UICollectionViewFlowLayout {
      let width = view.bounds.width
      let padding: CGFloat = 12
      let minimumItemSpacing: CGFloat = 10
      let availableWidth = width - (padding * 2) - (minimumItemSpacing*2)
      let itemWidth = availableWidth / CGFloat(columns)
      
      let flowLayout = UICollectionViewFlowLayout()
      flowLayout.sectionInset  = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
      flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
      
      return flowLayout
  }
}
