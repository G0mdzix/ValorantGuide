import Foundation

class DrawAgentsRouter: RouterProtocol {

  var entry: EntryPointDrawAgentsView?

  static func start() -> RouterProtocol {
    let router = DrawAgentsRouter()
    var view: ViewProtocol = DrawAgentsView()
    var presenter: PresenterProtocol = DrawAgentsPresenter()
    var interactor: InteractorProtocol = DrawAgentsInteractor()
    let agentsInteractor: AgentsInteractor = AgentsInteractor()
    view.presenter = presenter
    interactor.presenter = presenter
    interactor.agentInteractor = agentsInteractor
    agentsInteractor.drawInteractor = interactor
    presenter.router = router
    presenter.view = view
    presenter.interactor = interactor
    router.entry = view as? EntryPointDrawAgentsView
    return router
  }
}
