import Foundation
import UIKit
import SnapKit

class TitleCollectionMainViewCell: UICollectionViewCell {
    
    private let label = SkillNameLabel()
  
    override init(frame: CGRect) {
      super.init(frame: frame)
      contentView.addSubview(label)
    }

    required init?(coder: NSCoder) {
        fatalError("fatal_error")
    }

    override func layoutSubviews() {
        label.frame = contentView.bounds
    }
  
    public func configurate(with text: String) {
        label.text = text
        label.snp.makeConstraints { make in
          make.centerX.equalToSuperview()
          make.centerY.equalToSuperview()
        }
    }
}
