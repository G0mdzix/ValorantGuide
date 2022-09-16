import Foundation

class PlayerCardsPresenter: PlayerCardsProtocolePresenter {

  var playerCards: [PlayerCards] = []
  var router: PlayerCardsProtocoleRouter?
  var view: PlayerCardsProtocoleView?
  var interactor: PlayerCardsProtocoleInteractor? {
    didSet {
      interactor?.getPlayerCards()
    }
  }

  func interactprDidFetchPlayerCards(with result: Result<[PlayerCards], Error>) {
    switch result {
    case .success(let playerCards):
      self.playerCards = playerCards
    case .failure:
      print("Something went wrong")
    }
  }

  func numberOfPlayerCardsItems() -> Int {
    return playerCards.count
  }

  func playerCardsItem(at index: Int) -> PlayerCardsViewModel {
    let item = playerCards.map { PlayerCardsViewModel(playerCards: $0) }
    return item[index]
  }
}

struct PlayerCardsViewModel {
  let name: String
  let image: String
}

extension PlayerCardsViewModel {
  init(playerCards: PlayerCards) {
    self.name = playerCards.displayName
    self.image = playerCards.largeArt
  }
}
