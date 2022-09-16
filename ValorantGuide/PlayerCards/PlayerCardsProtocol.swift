import Foundation

protocol PlayerCardsProtocoleRouter {
  var entry: EntryPointPlayerCards? { get }
  static func start() -> PlayerCardsRouter
}

protocol PlayerCardsProtocoleInteractor {
  var presenter: PlayerCardsProtocolePresenter? { get set }
  func getPlayerCards()
}

protocol PlayerCardsProtocolePresenter {
  var router: PlayerCardsProtocoleRouter? { get set }
  var interactor: PlayerCardsProtocoleInteractor? { get set }
  var view: PlayerCardsProtocoleView? { get set }
  func interactprDidFetchPlayerCards(with result: Result<[PlayerCards], Error>)
  func numberOfPlayerCardsItems() -> Int
  func playerCardsItem(at index: Int) -> PlayerCardsViewModel
}

protocol PlayerCardsProtocoleView {
  var presenter: PlayerCardsProtocolePresenter? { get set }
}
