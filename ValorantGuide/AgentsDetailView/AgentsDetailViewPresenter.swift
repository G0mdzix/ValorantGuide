import Foundation

class AgentsDetailViewPresenter: AgentsDetailPresenter {
 
    var router: AgentsDetailRouter?
    var view: AgentsDetailView?
    var agent: Agent?
    
    func viewDidLoad() {
      view?.showAgentDetail(with: agent!)
    }
}
