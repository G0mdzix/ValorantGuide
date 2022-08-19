import UIKit

extension UIView {
  func setGradientBackground(colorOne: UIColor, colorTwo: UIColor) {
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = bounds
    gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
    gradientLayer.locations = [0.0, 4.0]
    layer.insertSublayer(gradientLayer, at: 0)
  }
}

extension UIView {
  func setGradientBackground(colorTop: UIColor, colorBottom: UIColor) {
    let gradientLayer = CAGradientLayer()
    gradientLayer.colors = [colorBottom.cgColor, colorTop.cgColor]
    gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
    gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
    gradientLayer.locations = [0, 1]
    gradientLayer.frame = bounds
    layer.insertSublayer(gradientLayer, at: 0)
    }
}
