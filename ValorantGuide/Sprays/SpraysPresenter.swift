import Foundation

class SpraysPreseneter: SprayProtocolePresenter {

  var sprays: [Sprays] = []
  var router: SprayProtocoleRouter?
  var view: SprayProtocoleView?
  var interactor: SprayProtocoleInteractor? {
    didSet {
      interactor?.getSprays()
    }
  }
  
  func interactprDidFetchSprays(with result: Result<[Sprays], Error>) {
    switch result {
    case .success(let sprays):
      self.sprays = sprays
    case .failure:
      print("Something went wrong")
    }
  }

  func numberOfSpraysItems() -> Int {
    return sprays.count
  }

  func spraysItem(at index: Int) -> SpraysViewModel {
    let item = sprays.map { SpraysViewModel(sprays: $0) }
    return item[index]
  }
}

struct SpraysViewModel {
  let name: String
  let image: String
}

extension SpraysViewModel {
  init (sprays: Sprays) {
    self.name = sprays.displayName
    self.image = sprays.displayIcon
  }
}
