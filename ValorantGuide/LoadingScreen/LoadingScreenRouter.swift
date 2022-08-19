import Foundation

class LoadingScreenRouter: LoadingScreenRouterProtocol {

  var entry: EntryPointLoadingScreen?
  
  static func start() -> LoadingScreenRouterProtocol {
    let router = LoadingScreenRouter()
    var view: LoadingScreenViewProtocol = LoadingScreenView()
    var presenter: LoadingScreenPresenterProtocol = LoadingScreenPresenter()
    view.presenter = presenter
    presenter.router = router
    presenter.view = view
    router.entry = view as? EntryPointLoadingScreen
    return router
  }
}
