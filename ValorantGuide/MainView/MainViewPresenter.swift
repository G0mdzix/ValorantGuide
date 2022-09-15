import Foundation
import UIKit

class MainViewPresenter: MainPresenter {

  var titles: [Titles] = []
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
      self.titles = titles
    case .failure:
      print("Something went wrong")
    }
  }

  func selectionTitlesListDidFetch(with result: Result<[SelectionTitles], Error>) {
    switch result {
    case .success(let selectionTitles):
      view?.updateSelectionTitles(with: selectionTitles)
    case .failure:
      print("Something went wrong")
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

extension MainViewPresenter {

  var mappedGameAid: [String] {
    return titles.map { $0.gameAid }
  }

  var mappedVisualThings: [String] {
    return titles.map { $0.visualThings }
  }

  var mappedGuides: [String] {
    return titles.map { $0.guides }
  }
}
