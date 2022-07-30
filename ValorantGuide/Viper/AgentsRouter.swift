import Foundation
import UIKit

class AgentsRouter: AgentRouter{
    var entry: EntryPoint?
    static func start() -> AgentRouter {
        let router = AgentsRouter()
        var view: AgentView = AgentsViewController()
        var presenter: AgentPresenter = AgentsPresenter()
        var interactor: AgentInteractor = AgentsInteractor()
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        router.entry = view as? EntryPoint
        return router
    }
}
