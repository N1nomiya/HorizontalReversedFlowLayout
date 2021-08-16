//
//  CustomDataSource.swift
//  HorizontalReversedFlowLayout
//
//  Created by ZhangChi on 2021/8/16.
//

import Foundation
import RxDataSources

struct CustomSectionItem {
  let index: Int
  var text: String { "\(index + 1)" }
}

extension CustomSectionItem: IdentifiableType, Equatable {
  var identity: Int { index }
}

struct CustomSetionModel {
  var items: [CustomSectionItem]
}

extension CustomSetionModel: SectionModelType, Equatable {
  init(original: CustomSetionModel, items: [CustomSectionItem]) {
    self = original
    self.items = items
  }
}
