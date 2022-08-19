import Foundation
import UIKit

class MainViewPresenter: MainPresenter {

  var view: MainView?
  var router: MainRouter?
  var interactor: MainInteractor? {
    didSet {
      interactor?.getTitlesList()
      interactor?.getSectionTitles()
    }
  }

  func titlesListDidFetch(with result: Result<[Titles], Error>) {
    switch result {
    case .success(let titles):
      view?.update(with: titles)
    case .failure:
      view?.update(with: "Something went wrong")
    }
  }

  func selectionTitlesListDidFetch(with result: Result<[SelectionTitles], Error>) {
    switch result {
    case .success(let selectionTitles):
      view?.updateSelectionTitles(with: selectionTitles)
    case .failure:
      view?.update(with: "Something went wrong")
    }
  }

  func showController(tableIndex: Int, collectionViewIndex: Int, navigationController: UINavigationController) {
    router?.pushToView(
      tableIndex: tableIndex,
      collectionViewIndex: collectionViewIndex,
      navigationConroller: navigationController
    )
  }
}
