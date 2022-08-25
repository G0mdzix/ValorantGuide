import Foundation

class AgentsInteractor: AgentInteractor {

  var drawInteractor: InteractorProtocol?
  var presenter: AgentPresenter?
  
  func getUsers() {
    guard let url = URL(string: K.agentsUrl) else { return }
    let task = URLSession.shared.dataTask(with: url) {[weak self] data, _, error in
      guard let data = data, error == nil else {
        self?.presenter?.interactprDidFetchAgents(with: .failure(FetchError.failed))
        self?.drawInteractor?.interactorDidFetchAgents(with: .failure(FetchError.failed))
        return
        }
        do {
          let etities = try JSONDecoder().decode(AgentsListEntity.self, from: data)
          self?.presenter?.interactprDidFetchAgents(with: .success(etities.data))
          self?.drawInteractor?.interactorDidFetchAgents(with: .success(etities.data))
          } catch {
          self?.presenter?.interactprDidFetchAgents(with: .failure(error))
          self?.drawInteractor?.interactorDidFetchAgents(with: .failure(error))
        }
    }
    task.resume()
  }
}
