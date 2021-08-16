//
//  CustomCell.swift
//  HorizontalReversedFlowLayout
//
//  Created by ZhangChi on 2021/8/16.
//

import UIKit
import Then
import SnapKit

class CustomCell: UICollectionViewCell {

  private lazy var container = UIView().then {
    $0.layer.cornerRadius = 5
    $0.layer.backgroundColor = UIColor.orange.cgColor
    $0.layer.cornerCurve = .continuous
    contentView.addSubview($0)
  }
  
  lazy var label = UILabel().then {
    $0.textColor = UIColor.black
    $0.textAlignment = .center
    $0.font = .systemFont(ofSize: 23, weight: .heavy)
    $0.numberOfLines = 1
    container.addSubview($0)
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
    addConstraints()
  }
  
  private func addConstraints() {
    container.snp.makeConstraints {
      $0.center.equalToSuperview()
    }
    label.snp.makeConstraints {
      $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 18, left: 18, bottom: 18, right: 18))
    }
  }
  
}

