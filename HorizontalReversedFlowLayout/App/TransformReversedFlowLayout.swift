//
//  TransformReversedFlowLayout.swift
//  HorizontalReversedFlowLayout
//
//  Created by ZhangChi on 2021/8/16.
//

import UIKit

class TransformReversedFlowLayout: UICollectionViewFlowLayout {
  
  override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
    let attrs = super.layoutAttributesForItem(at: indexPath)
    attrs?.transform = CGAffineTransform(scaleX: -1, y: 1)
    return attrs
  }
  
  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    let attrsList = super.layoutAttributesForElements(in: rect)
    if let list = attrsList {
      for i in 0..<list.count {
        list[i].transform = CGAffineTransform(scaleX: -1, y: 1)
      }
    }
    return attrsList
  }
  
}
