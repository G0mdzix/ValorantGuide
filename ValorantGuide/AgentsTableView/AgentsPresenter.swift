import Foundation
import UIKit

enum FetchError: Error {
  case failed
}

class AgentsPresenter: AgentPresenter {

  var agents: [Agent] = []
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
      self.agents = agent
    case .failure:
      view?.update(with: "Something went wrong")
    }
  }

  func showAgentsDetailController(with agentsViewModel: AgentsViewModel, navigationController: UINavigationController) {
    router?.pushToAgentsDetailView(with: agentsViewModel, navigationConroller: navigationController)
    }

  func numberOfAgentItems() -> Int {
    return agents.count
  }

  func agentItem(at index: Int) -> AgentsViewModel {
    let item = agents.map { AgentsViewModel(agent: $0) }
    return item[index]
  }
}

struct AgentsViewModel {
  let name: String
  let description: String
  let icon: String
  let secondName: String
  let roleName: String
  let agentAbilities: [AgentAbilities]
}

extension AgentsViewModel {
  init(agent: Agent) {
    self.name = agent.displayName
    self.description = agent.description
    self.icon = agent.displayIconSmall
    self.secondName = agent.developerName
    self.roleName = agent.role?.displayName ?? K.sovaError
    self.agentAbilities = agent.abilities
  }
}
