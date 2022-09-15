import Foundation
import UIKit
import SnapKit

class WeaponSkinsViewController: UIViewController, UICollectionViewDataSource,
                                 UICollectionViewDelegateFlowLayout, SkinsView {

  var presenter: SkinsPresenter?
  var collectionview: UICollectionView!
  let cellId = "Cell"
  let heightOfItemInCollectionView: CGFloat = 500

  override func viewDidLoad() {
    super.viewDidLoad()
    collectionViewAndLayoutSetup()
  }

  func collectionViewAndLayoutSetup() {
    let layout = UICollectionViewFlowLayout()
    layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    layout.itemSize = CGSize(width: view.frame.width, height: heightOfItemInCollectionView)
    collectionview = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
    collectionview.dataSource = self
    collectionview.delegate = self
    collectionview.register(WeaponSkinsCell.self, forCellWithReuseIdentifier: cellId)
    collectionview.showsVerticalScrollIndicator = false
    collectionview.backgroundColor = .black
    self.view.addSubview(collectionview)
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    guard let presenter = presenter else { return 0 }
    return presenter.numberOfBundlesItems()
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionview.dequeueReusableCell(
      withReuseIdentifier: cellId, for: indexPath
    )
    as? WeaponSkinsCell else {
    return UICollectionViewCell()
    }
    guard let presenter = presenter else { return UICollectionViewCell() }
    cell.showCaseImageView.loadFrom(URLAddress: presenter.bundlesItem(at: indexPath.row).graphic)
    cell.distanceLabel.text = presenter.bundlesItem(at: indexPath.row).name
    return cell
  }
}
