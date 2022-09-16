import Foundation

class PlayerCardsRouter: PlayerCardsProtocoleRouter {
  
  var entry: EntryPointPlayerCards?

  static func start() -> PlayerCardsRouter {
    let router = PlayerCardsRouter()
    var view: PlayerCardsProtocoleView = PlayerCardsViewController()
    var presenter: PlayerCardsProtocolePresenter = PlayerCardsPresenter()
    var interactor: PlayerCardsProtocoleInteractor = PlayerCardsInteractor()
    view.presenter = presenter
    interactor.presenter = presenter
    presenter.router = router
    presenter.view = view
    presenter.interactor = interactor
    router.entry = view as? EntryPointPlayerCards
    return router
  }
}
