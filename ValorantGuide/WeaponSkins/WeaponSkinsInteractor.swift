import Foundation

class WeaponSkinsInteractor: SkinsInteractor {

  var presenter: SkinsPresenter?

  func getBundles() {
    guard let url = URL(string: K.bundlesUrl) else { return }
    let task = URLSession.shared.dataTask(with: url) {[weak self] data, _, error in
      guard let data = data, error == nil else {
        self?.presenter?.interactprDidFetchBundles(with: .failure(FetchError.failed))
        return
        }
        do {
          let etities = try JSONDecoder().decode(WeaponSkinsEntity.self, from: data)
          self?.presenter?.interactprDidFetchBundles(with: .success(etities.data))
          } catch {
          self?.presenter?.interactprDidFetchBundles(with: .failure(error))
        }
    }
    task.resume()
  }
}
