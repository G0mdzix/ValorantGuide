import Foundation

class AgentsDetailViewPresenter: AgentsDetailPresenter {
 
  var router: AgentsDetailRouter?
  var view: AgentsDetailView?
  var agent: Agent?

  func viewDidLoad() {
    if let agentModel = agent {
      view?.showAgentDetail(with: agentModel)
    }
  }
}
