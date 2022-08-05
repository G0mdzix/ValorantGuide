import Foundation

class AgentsDetailViewRouter: AgentsDetailRouter {
   
    static func start(detailRef: AgentsDetailViewController, agent: Agent) {
        let presenter = AgentsDetailViewPresenter()
        presenter.agent = agent
        detailRef.presenter = presenter
        detailRef.presenter?.view = detailRef
        detailRef.presenter?.router = AgentsDetailViewRouter()
    }
}
