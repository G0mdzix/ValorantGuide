import Foundation
import UIKit

class DescriptionLabel: UILabel {

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    initializeLabel()
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    initializeLabel()
  }

  func initializeLabel() {
    self.lineBreakMode = .byWordWrapping
    self.numberOfLines = 0
    self.textAlignment = .center
    self.font = .boldSystemFont(ofSize: 12)
    self.textColor = .white
    self.layer.cornerRadius = 5
    self.clipsToBounds = true
    self.translatesAutoresizingMaskIntoConstraints = false
  }
}

class SkillNameLabel: UILabel {

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    initializeLabel()
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    initializeLabel()
  }

  func initializeLabel() {
    self.font = .boldSystemFont(ofSize: 20)
    self.textColor = .white
    self.translatesAutoresizingMaskIntoConstraints = false
  }
}

class AgentsNameLabel: UILabel {

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    initializeLabel()
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    initializeLabel()
  }

  func initializeLabel() {
    self.font = .boldSystemFont(ofSize: 20)
    self.textColor = .white
    self.translatesAutoresizingMaskIntoConstraints = false
    self.textAlignment = .center
    self.backgroundColor = .darkText
    self.layer.cornerRadius = 35
  }
}
