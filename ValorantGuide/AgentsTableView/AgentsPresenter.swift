import Foundation
import UIKit

enum FetchError: Error {
  case failed
}

class AgentsPresenter: AgentPresenter {
  
  var router: AgentRouter?
  var view: AgentView?
  var interactor: AgentInteractor? {
    didSet {
      interactor?.getUsers()
    }
  }

  func interactprDidFetchAgents(with result: Result<[Agent], Error>) {
    switch result {
    case .success(let agent):
      view?.update(with: agent)
    case .failure:
      view?.update(with: "Something went wrong")
    }
  }

  func showAgentsDetailController(with agent: Agent, navigationController: UINavigationController) {
    router?.pushToAgentsDetailView(with: agent, navigationConroller: navigationController)
    }
}
