import Foundation

struct SpraysEnitity: Codable {
  var data: [Sprays]
}

struct Sprays: Codable {
  let displayName: String
  let displayIcon: String
}
