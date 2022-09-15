import Foundation

class AgentsDetailViewRouter: AgentsDetailRouter {
   
  static func start(detailRef: AgentsDetailViewController, agentsViewModel: AgentsViewModel) {
    let presenter = AgentsDetailViewPresenter()
    presenter.agent = agentsViewModel
    detailRef.presenter = presenter
    detailRef.presenter?.view = detailRef
    detailRef.presenter?.router = AgentsDetailViewRouter()
  }
}
