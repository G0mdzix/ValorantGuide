import Foundation
import UIKit

protocol RouterProtocol {
  var entry: EntryPointDrawAgentsView? { get }
  static func start() -> RouterProtocol
}

protocol ViewProtocol {
  var presenter: PresenterProtocol? { get set }
  func update(with agent: [Agent])
}

protocol PresenterProtocol {
  var router: RouterProtocol? { get set }
  var view: ViewProtocol? { get set }
  var interactor: InteractorProtocol? { get set }
  func getDrawAgents(randomAgent: [Agent])
  func getNumberOfAgents(number: Int)
  func startDrawingAgents(start: Bool)
}

protocol InteractorProtocol {
  var presenter: PresenterProtocol? { get set }
  var agentInteractor: AgentsInteractor? { get set }
  func interactorDidFetchAgents(with result: Result<[Agent], Error>)
  func sendDrewAgents(start: Bool)
  func getNumberOfAgents(number: Int)
}
