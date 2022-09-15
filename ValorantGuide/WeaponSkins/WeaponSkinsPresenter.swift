import Foundation

class WeaponSkinsPresenter: SkinsPresenter {

  var bundles: [Bundles] = []
  var router: SkinsRouter?
  var view: SkinsView?
  var interactor: SkinsInteractor? {
    didSet {
      interactor?.getBundles()
    }
  }

  func interactprDidFetchBundles(with result: Result<[Bundles], Error>) {
    switch result {
    case .success(let bundles):
      self.bundles = bundles
    case .failure:
      print("Something went wrong")
    }
  }

  func numberOfBundlesItems() -> Int {
    return bundles.count
  }

  func bundlesItem(at index: Int) -> BundlesViewModel {
    let item = bundles.map { BundlesViewModel(bundles: $0) }
    return item[index]
  }
}

struct BundlesViewModel {
  let name: String
  let graphic: String
}

extension BundlesViewModel {
  init(bundles: Bundles) {
    self.name = bundles.displayName
    self.graphic = bundles.displayIcon
  }
}
