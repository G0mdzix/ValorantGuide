import Foundation
import UIKit


protocol AgentsDetailView {
    func showAgentDetail(with agent: Agent)
}

protocol AgentsDetailInteractor {
    var presenter: AgentsDetailPresenter? {get set}
}

protocol AgentsDetailRouter {
    static func start(detailRef: AgentsDetailViewController, agent: Agent) 
}

protocol AgentsDetailPresenter{
    var router: AgentsDetailRouter? {get set}
    var view: AgentsDetailView? {get set}
    var agent: Agent? {get set}
    func viewDidLoad()
}
