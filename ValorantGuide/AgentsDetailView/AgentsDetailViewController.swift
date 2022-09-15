import Foundation
import UIKit
import SnapKit

class AgentsDetailViewController: UIViewController, AgentsDetailView {

  var presenter: AgentsDetailPresenter?
  let space: String = " ✦ "
  let mainSkillLabelText: String = "ABILITIES"
  let skillLabel = AgentsNameLabel()
  let agentNameLabel = AgentsNameLabel()
  let containerIconBackground = ContainerBackground()
  let containerSkillBackgroundView = ContainerAbilities()
  let containerFirstAbilityView = ContainerAbilities()
  let containerSecondAbilityView = ContainerAbilities()
  let containerThirdAbilityView = ContainerAbilities()
  let containerUltAbilityView = ContainerAbilities()
  let agentIconImageView = IconImage()

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    let containers = containers()
    for container in containers {
      container.setGradientBackground(colorTop: Colors.black, colorBottom: Colors.greay)
    }
    containerSkillBackgroundView.setGradientBackground(colorTop: Colors.greay, colorBottom: .white)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    view.setGradientBackground(colorOne: Colors.red, colorTwo: Colors.dark)
    setupView()
    presenter?.viewDidLoad()
  }

  func containers() -> [ContainerAbilities] {
    let containers = [
      containerFirstAbilityView,
      containerSecondAbilityView,
      containerThirdAbilityView,
      containerUltAbilityView
    ]
      return containers
  }

  func showAgentDetail(with agent: AgentsViewModel) {
    let containers = containers()
    for (index, element) in containers.enumerated() {
      element.skillIconImageView.loadFrom(URLAddress: agent.agentAbilities[index].displayIcon ?? K.sovaError)
      element.skillNameLabel.text = agent.agentAbilities[index].displayName
      element.skillDescriptionLabel.text = agent.agentAbilities[index].description
    }
      agentNameLabel.text = agent.name + space + agent.secondName + space + agent.roleName
      agentIconImageView.loadFrom(URLAddress: agent.icon)
      skillLabel.text = mainSkillLabelText
  }

  func contanerConstraint (centerXOfset: Int, viewBottom: (UIView), view: (UIView)) {
    view.snp.makeConstraints { make in
      make.width.equalTo(185)
      make.height.equalTo(275)
      make.centerX.equalToSuperview().offset(centerXOfset)
      make.top.equalTo(viewBottom.snp.bottom).offset(15)
    }
  }

  func setupView() {
    view.addSubview(containerIconBackground)
    view.addSubview(containerSkillBackgroundView)
    view.addSubview(agentNameLabel)
    view.addSubview(skillLabel)
    view.addSubview(agentIconImageView)
    view.addSubview(containerFirstAbilityView)
    view.addSubview(containerSecondAbilityView)
    view.addSubview(containerThirdAbilityView)
    view.addSubview(containerUltAbilityView)

    skillLabel.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalTo(agentIconImageView.snp.bottom).offset(30)
    }
    agentNameLabel.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.width.equalToSuperview()
      make.top.equalTo(agentIconImageView.snp.bottom).offset(5)
    }
    agentIconImageView.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.topMargin.equalToSuperview().offset(10)
      make.size.equalTo(75)
    }
    containerSkillBackgroundView.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.width.equalToSuperview()
      make.height.equalToSuperview()
      make.top.equalTo(agentIconImageView.snp.bottom).offset(30)
    }
    containerIconBackground.snp.makeConstraints { make in
      make.centerX.equalTo(agentIconImageView)
      make.centerY.equalTo(agentIconImageView)
      make.size.equalTo(100)
    }
    contanerConstraint(centerXOfset: 100, viewBottom: skillLabel, view: containerFirstAbilityView)
    contanerConstraint(centerXOfset: -100, viewBottom: skillLabel, view: containerSecondAbilityView)
    contanerConstraint(centerXOfset: -100, viewBottom: containerSecondAbilityView, view: containerThirdAbilityView)
    contanerConstraint(centerXOfset: 100, viewBottom: containerFirstAbilityView, view: containerUltAbilityView)
  }
}
