import Foundation

struct PlayerCardsEntity: Codable {
  let data: [PlayerCards]
}

struct PlayerCards: Codable {
  let displayName: String
  let largeArt: String
}
