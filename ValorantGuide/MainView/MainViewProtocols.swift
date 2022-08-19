import Foundation
import UIKit

protocol MainView {
  var presenter: MainPresenter? { get set }
  func update(with titles: [Titles])
  func update(with error: String)
  func updateSelectionTitles(with sectionTitles: [SelectionTitles])
}

protocol MainInteractor {
  var presenter: MainPresenter? { get set }
  func getTitlesList()
  func getSectionTitles()
}

protocol MainRouter {
  var entry: EntryPointMainView? { get }
  static func start() -> MainRouter
  func pushToView(tableIndex: Int, collectionViewIndex: Int, navigationConroller: UINavigationController)
}

protocol MainPresenter {
  var router: MainRouter? { get set }
  var interactor: MainInteractor? { get set }
  var view: MainView? { get set }
  func titlesListDidFetch(with result: Result<[Titles], Error>)
  func selectionTitlesListDidFetch(with result: Result<[SelectionTitles], Error>)
  func showController(tableIndex: Int, collectionViewIndex: Int, navigationController: UINavigationController)
}

protocol MainTableViewCellDelegate: AnyObject {
  func passTheCurrent(tableIndex: Int, collectionViewIndex: Int)
}
