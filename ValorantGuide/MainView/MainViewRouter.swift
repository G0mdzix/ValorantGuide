import Foundation
import UIKit

class MainViewRouter: MainRouter {

  var entry: EntryPointMainView?
  
  static func start() -> MainRouter {
    let router = MainViewRouter()
    var view: MainView = MainViewController()
    var presenter: MainPresenter = MainViewPresenter()
    var interactor: MainInteractor = MainViewInteractor()
    view.presenter = presenter
    interactor.presenter = presenter
    presenter.router = router
    presenter.view = view
    presenter.interactor = interactor
    router.entry = view as? EntryPointMainView
    return router
  }
  
  func pushToView(tableIndex: Int, collectionViewIndex: Int, navigationConroller: UINavigationController) {
    switch tableIndex {
    case 0:
      switch collectionViewIndex {
      case 0:
        if let selectpile = AgentsRouter.start().entry {
          navigationConroller.pushViewController(selectpile, animated: true)
        }
      case 1...2:
        if let selectpile = LoadingScreenRouter.start().entry {
          navigationConroller.pushViewController(selectpile, animated: true)
        }
      default:
        print("")
      }
    case 1:
      switch collectionViewIndex {
      case 0:
        if let selectpile = WeaponSkinsRouter.start().entry {
          navigationConroller.pushViewController(selectpile, animated: true)
        }
      case 1...2:
        if let selectpile = LoadingScreenRouter.start().entry {
          navigationConroller.pushViewController(selectpile, animated: true)
        }
      default:
        print("")
      }
    case 2:
      switch collectionViewIndex {
      case 0:
        if let selectpile = DrawAgentsRouter.start().entry {
          navigationConroller.pushViewController(selectpile, animated: true)
        }
      case 1...2:
        if let selectpile = LoadingScreenRouter.start().entry {
          navigationConroller.pushViewController(selectpile, animated: true)
        }
      default:
        print("")
      }
    default:
      ""
      }
    }
}
