import Foundation

protocol AgentView {
    var presenter: AgentPresenter? {get set}
    func update(with users: [Agent])
    func update(with error: String)
}

protocol AgentInteractor {
    var presenter: AgentPresenter? {get set}
    func getUsers()
}

protocol AgentRouter {
    var entry:  EntryPoint? {get}
    static func start() -> AgentRouter
}

protocol AgentPresenter{
    var router: AgentRouter? {get set}
    var interactor: AgentInteractor? {get set}
    var view: AgentView? {get set}
    func interactprDidFetchUsers(with result: Result<[Agent], Error>)
}
