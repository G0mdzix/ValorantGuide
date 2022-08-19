import Foundation
import UIKit

class LoadingScreenView: UIViewController, LoadingScreenViewProtocol {
    
  var presenter: LoadingScreenPresenterProtocol?

  let loadingIndicator: ProgressView = {
    let progress = ProgressView(colors: [.red, .systemGreen, .systemBlue], lineWidth: 5)
    progress.translatesAutoresizingMaskIntoConstraints = false
    return progress
    }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.setGradientBackground(colorTop: .white, colorBottom: Colors.greay)
    loadingOfIndicator()
    }

  func loadingOfIndicator() {
    view.addSubview(loadingIndicator)
    loadingIndicator.animateStroke()
    loadingIndicator.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.centerY.equalToSuperview()
      make.size.equalTo(125)
    }
  }
}
