//
//  ViewController.swift
//  HorizontalReversedFlowLayout
//
//  Created by ZhangChi on 2021/8/16.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class ViewController: UIViewController {

  let customView = CustomView()
  override func loadView() {
    view = customView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    bindViewModel()
  }

  private func bindViewModel() {
    let viewModel = ViewModel()
    viewModel.dataSource.drive(customView.collectionView.rx.items(dataSource: dataSource)).disposed(by: rx.disposeBag)
  }

}

fileprivate let dataSource = RxCollectionViewSectionedReloadDataSource<CustomSetionModel> { ds, cv, idp, item in
  let cell: CustomCell = cv.dequeueReusableCell(forIndexPath: idp)
  cell.label.text = item.text
  return cell
}
