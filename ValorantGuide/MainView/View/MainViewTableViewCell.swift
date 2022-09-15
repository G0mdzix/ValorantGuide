import Foundation
import UIKit

class MainViewTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {

  private var titles: [String] = [String]()
  var delegate: MainTableViewCellDelegate?
  var index: Int?

  private let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.itemSize = CGSize(width: 140, height: 200)
    layout.scrollDirection = .horizontal
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.register(TitleCollectionMainViewCell.self, forCellWithReuseIdentifier: "cell")
    collectionView.backgroundColor = .black
    return collectionView
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.backgroundColor = .systemPink
    contentView.addSubview(collectionView)
    collectionView.delegate = self
    collectionView.dataSource = self
  }

  required init?(coder: NSCoder) {
    fatalError("fatal_error")
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    collectionView.frame = contentView.bounds
  }

  public func configure(with titles: [String]) {
    self.titles = titles
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return titles.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: "cell",
      for: indexPath
    )
      as? TitleCollectionMainViewCell else {
      return UICollectionViewCell()
    }
    cell.setGradientBackground(colorOne: Colors.red, colorTwo: Colors.dark)
    let model = titles[indexPath.row]
    cell.configurate(with: model)
    return cell
  }

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    collectionView.deselectItem(at: indexPath, animated: true)
    if let index = index {
      if let del = self.delegate {
        del.passTheCurrent(tableIndex: index, collectionViewIndex: indexPath.item)
      }
    }
  }
}
