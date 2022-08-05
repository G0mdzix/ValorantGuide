import Foundation

class AgentsInteractor: AgentInteractor {
    
    var presenter: AgentPresenter?
    
    func getUsers() {
        guard let url = URL(string: K.agentsUrl) else {return}
        let task = URLSession.shared.dataTask(with: url) {[weak self] data, _, error in
            guard let data = data, error == nil else {
                self?.presenter?.interactprDidFetchUsers(with: .failure(FetchError.failed))
                return
            }
            do {
                let etities = try JSONDecoder().decode(AgentsListEntity.self, from: data)
                self?.presenter?.interactprDidFetchUsers(with: .success(etities.data))
            }
            catch {
                self?.presenter?.interactprDidFetchUsers(with: .failure(error))
            }
        }
        task.resume()
    }
}
