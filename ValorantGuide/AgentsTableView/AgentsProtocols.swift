import Foundation
import UIKit

protocol AgentView {
  var presenter: AgentPresenter? { get set }
  func update(with agent: [Agent])
  func update(with error: String)
}

protocol AgentInteractor {
  var presenter: AgentPresenter? { get set }
  var drawInteractor: InteractorProtocol? { get set }
  func getUsers()
}

protocol AgentRouter {
  var entry: EntryPointAgents? { get }
  static func start() -> AgentRouter
  func pushToAgentsDetailView(with agent: Agent, navigationConroller: UINavigationController)
}

protocol AgentPresenter {
  var router: AgentRouter? { get set }
  var interactor: AgentInteractor? { get set }
  var view: AgentView? { get set }
  func interactprDidFetchAgents(with result: Result<[Agent], Error>)
  func showAgentsDetailController(with agent: Agent, navigationController: UINavigationController)
}
