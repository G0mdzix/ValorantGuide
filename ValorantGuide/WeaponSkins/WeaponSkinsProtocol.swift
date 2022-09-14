import Foundation

protocol SkinsRouter {
  var entry: EntryPointWeaponSkinsView? { get }
  static func start() -> WeaponSkinsRouter
}

protocol SkinsInteractor {
  var presenter: SkinsPresenter? { get set }
  func getBundles()
}

protocol SkinsPresenter {
  var router: SkinsRouter? { get set }
  var interactor: SkinsInteractor? { get set }
  var view: SkinsView? { get set }
  func interactprDidFetchBundles(with result: Result<[Bundles], Error>)
  func numberOfBundlesItems() -> Int
  func bundlesItem(at index: Int) -> BundlesViewModel
}

protocol SkinsView {
  var presenter: SkinsPresenter? { get set }
}
