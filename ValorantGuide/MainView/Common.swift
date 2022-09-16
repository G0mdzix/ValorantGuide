import Foundation

class Common: NSObject {
    
  class func generateDataTitlesList() -> [[String: String]] {
    let data = [
      ["title": "Agents", "visual": "Weapon Skins", "aid": "Random"],
      ["title": "Gamemodes", "visual": "Sprays", "aid": "X"],
      ["title": "Weapons", "visual": "Cards", "aid": "X"]
    ]
  return data
    }
  
  class func generateDataSelecitonTitlesList() -> [[String: String]] {
    let data = [
      ["title": "Guides"],
      ["title": "VisualThings"],
      ["title": "GameAid"]
    ]
    return data
  }
}
