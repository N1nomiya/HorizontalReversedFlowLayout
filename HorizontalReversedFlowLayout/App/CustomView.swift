//
//  CustomView.swift
//  HorizontalReversedFlowLayout
//
//  Created by ZhangChi on 2021/8/16.
//

import UIKit
import RxSwift
import RxCocoa

class CustomView: UIView {
  
  private let layout = TransformReversedFlowLayout().then {
    $0.scrollDirection = .horizontal
    $0.minimumLineSpacing = 0
    $0.minimumInteritemSpacing = 0
    $0.sectionInset = .zero
    $0.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
  }
  lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).then {
    $0.backgroundColor = .clear
    $0.allowsSelection = false
    $0.allowsMultipleSelection = false
    $0.showsHorizontalScrollIndicator = false
    $0.isPagingEnabled = true
    $0.alwaysBounceHorizontal = true
    $0.contentInsetAdjustmentBehavior = .never
    $0.automaticallyAdjustsScrollIndicatorInsets = false
    $0.rx.setDelegate(self).disposed(by: rx.disposeBag)
    $0.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.reuseIdentifier)
    // transform flip
    $0.transform = CGAffineTransform(scaleX: -1, y: 1)
    addSubview($0)
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
  }
  
  private func setup() {
    backgroundColor = .white
    addConstraints()
  }
  
  private func addConstraints() {
    collectionView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
}

extension CustomView: UICollectionViewDelegateFlowLayout {
  
}
