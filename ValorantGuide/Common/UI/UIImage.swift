import Foundation
import UIKit

class IconImage: UIImageView {
    
  convenience init() {
    self.init(frame: .zero)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    self.translatesAutoresizingMaskIntoConstraints = false
    self.clipsToBounds = true
    self.layer.cornerRadius = 45
    self.backgroundColor = .black
  }
}
