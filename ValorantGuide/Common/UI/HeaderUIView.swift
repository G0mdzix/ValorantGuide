import Foundation
import UIKit
import SnapKit

class MainHeaderUIView: UIView {
    
    private let mainImageView: UIImageView = {
      let imageView = UIImageView()
      imageView.contentMode = .scaleAspectFit
      imageView.clipsToBounds = true
      imageView.image = UIImage(named: "Header")
      return imageView
    }()

    private let mainLabel: UILabel = {
      let label = UILabel()
      label.font = .boldSystemFont(ofSize: 40)
      label.textColor = .red
      label.layer.cornerRadius = 5
      label.clipsToBounds = true
      label.text = "VALORANT - GUIDE"
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()

    override func layoutSubviews() {
      super.layoutSubviews()
      mainImageView.frame = bounds
    }

    required init?(coder: NSCoder) {
      fatalError("fatal_error")
    }

  private func addGradient() {
    let gradientLayer = CAGradientLayer()
    gradientLayer.colors = [
      UIColor.clear.cgColor,
      UIColor.systemBackground.cgColor
    ]
    gradientLayer.frame = bounds
    layer.addSublayer(gradientLayer)
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(mainImageView)
    addSubview(mainLabel)
    addGradient()
    setup()
  }

  func setup() {
    mainLabel.snp.makeConstraints { make in
      make.centerX.equalTo(mainImageView)
      make.bottomMargin.equalTo(mainImageView)
    }
  }
  }
