import Foundation

protocol SprayProtocoleRouter {
  var entry: EntryPointSprays? { get }
  static func start() -> SpraysRouter
}

protocol SprayProtocoleInteractor {
  var presenter: SprayProtocolePresenter? { get set }
  func getSprays()
}

protocol SprayProtocolePresenter {
  var router: SprayProtocoleRouter? { get set }
  var interactor: SprayProtocoleInteractor? { get set }
  var view: SprayProtocoleView? { get set }
  func interactprDidFetchSprays(with result: Result<[Sprays], Error>)
  func numberOfSpraysItems() -> Int
  func spraysItem(at index: Int) -> SpraysViewModel
}

protocol SprayProtocoleView {
  var presenter: SprayProtocolePresenter? { get set }
}
