import Foundation

class PlayerCardsInteractor: PlayerCardsProtocoleInteractor {

  var presenter: PlayerCardsProtocolePresenter?

  func getPlayerCards() {
    guard let url = URL(string: K.playerCardsUrl) else { return }
    let task = URLSession.shared.dataTask(with: url) {[weak self] data, _, error in
      guard let data = data, error == nil else {
        self?.presenter?.interactprDidFetchPlayerCards(with: .failure(FetchError.failed))
        return
        }
        do {
          let etities = try JSONDecoder().decode(PlayerCardsEntity.self, from: data)
          self?.presenter?.interactprDidFetchPlayerCards(with: .success(etities.data))
          } catch {
          self?.presenter?.interactprDidFetchPlayerCards(with: .failure(error))
        }
    }
    task.resume()
  }
}
