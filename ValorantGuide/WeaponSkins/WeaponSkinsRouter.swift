import Foundation

class WeaponSkinsRouter: SkinsRouter {
  
  var entry: EntryPointWeaponSkinsView?

  static func start() -> WeaponSkinsRouter {
    let router = WeaponSkinsRouter()
    var view: SkinsView = WeaponSkinsViewController()
    var presenter: SkinsPresenter = WeaponSkinsPresenter()
    var interactor: SkinsInteractor = WeaponSkinsInteractor()
    view.presenter = presenter
    interactor.presenter = presenter
    presenter.router = router
    presenter.view = view
    presenter.interactor = interactor
    router.entry = view as? EntryPointWeaponSkinsView
    return router
  }
}
