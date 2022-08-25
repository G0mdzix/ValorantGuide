import Foundation
import UIKit
import SnapKit

class ContainerBackground: UIView {

  override func layoutSubviews() {
    super.layoutSubviews()
    }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    initializeContainer()
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    initializeContainer()
  }

  func initializeContainer() {
    self.translatesAutoresizingMaskIntoConstraints = false
    self.clipsToBounds = true
    self.layer.cornerRadius = 45
  }
}

class ContainerAbilities: UIView {

  let skillDescriptionLabel = DescriptionLabel()
  let skillNameLabel = SkillNameLabel()
  let skillIconImageView = IconImage()

  override func layoutSubviews() { super.layoutSubviews() }
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      initializeContainer()
      sharedLayout()
    }

  override init(frame: CGRect) {
    super.init(frame: frame)
    initializeContainer()
    sharedLayout()
    }

  func initializeContainer() {
    self.translatesAutoresizingMaskIntoConstraints = false
    self.clipsToBounds = true
    self.layer.cornerRadius = 45
    }

  private func sharedLayout() {
    self.addSubview(skillIconImageView)
    self.addSubview(skillNameLabel)
    self.addSubview(skillDescriptionLabel)
    
    skillDescriptionLabel.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.width.equalToSuperview()
      make.top.equalTo(skillNameLabel.snp.bottom).offset(15)
    }
    skillNameLabel.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalTo(skillIconImageView.snp.bottom).offset(15)
    }
    skillIconImageView.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.topMargin.equalToSuperview().offset(5)
      make.size.equalTo(75)
    }
  }
}

class DrawAgentsContainer: UIView {

  let agentNameLabel = SkillNameLabel()
  let agentIconImage = IconImage()

  override func layoutSubviews() { super.layoutSubviews() }
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      initializeContainer()
      sharedLayout()
    }

  override init(frame: CGRect) {
    super.init(frame: frame)
    initializeContainer()
    sharedLayout()
    }

  func initializeContainer() {
    self.translatesAutoresizingMaskIntoConstraints = false
    self.clipsToBounds = true
    self.layer.cornerRadius = 45
    }

  private func sharedLayout() {
    self.addSubview(agentIconImage)
    self.addSubview(agentNameLabel)

    agentNameLabel.snp.makeConstraints { make in
      make.centerY.trailing.equalToSuperview()
      make.leftMargin.equalTo(agentIconImage.snp_rightMargin).offset(30)
    }

    agentIconImage.snp.makeConstraints { make in
      make.centerY.leading.equalToSuperview()
      make.leading.equalToSuperview().offset(40) 
      make.size.equalTo(215)
    }
  }
}
