import Foundation
import UIKit

class WeaponSkinsCell: UICollectionViewCell {

  let distanceLabel: UILabel = {
    let label = UILabel()
    label.textColor = .lightGray
    label.font = .boldSystemFont(ofSize: 20)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  let showCaseImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.backgroundColor = .white
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()

  let topSeparatorView: UIView = {
    let view = UIView()
    view.backgroundColor = .darkGray
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  let bottomSeparatorView: UIView = {
    let view = UIView()
    view.backgroundColor = .darkGray
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    addViews()
  }

  func addViews() {
    backgroundColor = .black
    addSubview(distanceLabel)
    addSubview(showCaseImageView)
    addSubview(topSeparatorView)
    addSubview(bottomSeparatorView)

    distanceLabel.snp.makeConstraints { make in
      make.center.equalTo(topSeparatorView).offset(-25)
    }

  topSeparatorView.snp.makeConstraints { make in
    make.topMargin.equalToSuperview().offset(75)
    make.width.equalToSuperview()
    make.height.equalTo(10)
  }

  bottomSeparatorView.snp.makeConstraints { make in
    make.bottomMargin.equalToSuperview().offset(-35)
    make.width.equalToSuperview()
    make.height.equalTo(10)
  }

  showCaseImageView.snp.makeConstraints { make in
    make.right.equalToSuperview()
    make.left.equalToSuperview()
    make.top.equalTo(topSeparatorView)
    make.bottom.equalTo(bottomSeparatorView)
  }
}

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
