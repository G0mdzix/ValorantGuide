import Foundation
import UIKit

protocol AgentsDetailView {
  func showAgentDetail(with agent: AgentsViewModel)
}

protocol AgentsDetailRouter {
  static func start(detailRef: AgentsDetailViewController, agentsViewModel: AgentsViewModel) 
}

protocol AgentsDetailPresenter {
  var router: AgentsDetailRouter? { get set }
  var view: AgentsDetailView? { get set }
  var agent: AgentsViewModel? { get set }
  func viewDidLoad()
}
