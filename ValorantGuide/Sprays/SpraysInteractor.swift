import Foundation

class SpraysInteractor: SprayProtocoleInteractor {
  
  var presenter: SprayProtocolePresenter?

  func getSprays() {
    guard let url = URL(string: K.spraysUrl) else { return }
    let task = URLSession.shared.dataTask(with: url) {[weak self] data, _, error in
      guard let data = data, error == nil else {
        self?.presenter?.interactprDidFetchSprays(with: .failure(FetchError.failed))
        return
        }
        do {
          let etities = try JSONDecoder().decode(SpraysEnitity.self, from: data)
          self?.presenter?.interactprDidFetchSprays(with: .success(etities.data))
          } catch {
          self?.presenter?.interactprDidFetchSprays(with: .failure(error))
        }
    }
    task.resume()
  }
}
