import Foundation

class SpraysRouter: SprayProtocoleRouter {

  var entry: EntryPointSprays?

  static func start() -> SpraysRouter {
    let router = SpraysRouter()
    var view: SprayProtocoleView = SpraysViewController()
    var presenter: SprayProtocolePresenter = SpraysPreseneter()
    var interactor: SprayProtocoleInteractor = SpraysInteractor()
    view.presenter = presenter
    interactor.presenter = presenter
    presenter.router = router
    presenter.view = view
    presenter.interactor = interactor
    router.entry = view as? EntryPointSprays
    return router
  }
}
