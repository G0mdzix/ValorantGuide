import Foundation

struct Titles {
  let guides: String
  let gameAid: String
  let visualThings: String

  init(attributes: [String: String]) {
    self.guides = attributes["title"] ?? ""
    self.gameAid = attributes["aid"] ?? ""
    self.visualThings = attributes["visual"] ?? ""
  }
}

struct SelectionTitles {
  let sectionTitles: String
    
  init(attributes: [String: String]) {
    self.sectionTitles = attributes["title"] ?? ""
  }
}

