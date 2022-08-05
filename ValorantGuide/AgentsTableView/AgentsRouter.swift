import Foundation
import UIKit

class AgentsRouter: AgentRouter{

    var entry: EntryPointAgents?
    static func start() -> AgentRouter {
        let router = AgentsRouter()
        var view: AgentView = AgentsTableViewController()
        var presenter: AgentPresenter = AgentsPresenter()
        var interactor: AgentInteractor = AgentsInteractor()
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        router.entry = view as? EntryPointAgents
        return router
    }

    func pushToAgentsDetailView(with agent: Agent, navigationConroller: UINavigationController) {
        let agentsDetailModue = AgentsDetailViewController()
        navigationConroller.pushViewController(agentsDetailModue, animated: true)
        AgentsDetailViewRouter.start(detailRef: agentsDetailModue, agent: agent)
    }
}
