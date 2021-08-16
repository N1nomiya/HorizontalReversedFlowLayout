//
//  ViewModel.swift
//  HorizontalReversedFlowLayout
//
//  Created by ZhangChi on 2021/8/16.
//

import Foundation
import RxSwift
import RxCocoa


struct ViewModel {
  
  let dataSource: Driver<[CustomSetionModel]>
  
  init() {
    
    let sources = (0..<10).map { $0 }
    let sourcesRelay = BehaviorRelay<[Int]>(value: sources)
    dataSource = sourcesRelay
      .asDriver()
      .map { sources in [CustomSetionModel(items: sources.map { CustomSectionItem(index: $0) })] }
      
  }
  
}
