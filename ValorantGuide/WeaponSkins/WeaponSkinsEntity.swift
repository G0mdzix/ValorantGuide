import Foundation

struct WeaponSkinsEntity: Codable {
  var data: [Bundles]
}

struct Bundles: Codable {
  let displayName: String
  let displayIcon: String
}
