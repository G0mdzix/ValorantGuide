import Foundation

enum FetchError: Error {
    case failed
}

class AgentsPresenter: AgentPresenter {
    
    var router: AgentRouter?
    var view: AgentView?
    var interactor: AgentInteractor?{
        didSet{
            interactor?.getUsers()
        }
    }
    
    func interactprDidFetchUsers(with result: Result<[Agent], Error>) {
        switch result{
        case .success(let Agent):
            view?.update(with: Agent)
        case .failure:
            view?.update(with: "Something went wrong")
        }
    }
}
