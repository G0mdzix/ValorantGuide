import Foundation
import UIKit
import SnapKit

class DrawAgentsView: UIViewController, ViewProtocol {

  
  var presenter: PresenterProtocol?
  var numberOfDrewdAgents: Int = 0
  let mainLabel = DescriptionLabel()
  let firstAgentContainer = DrawAgentsContainer() 
  let secondAgentContainer = DrawAgentsContainer()
  let thirdAgentContainer = DrawAgentsContainer()
  let fourthAgentContainer = DrawAgentsContainer()
  let fifthAgentContainer = DrawAgentsContainer()
  let mainContainer = ContainerBackground()

  lazy var slider: UISlider = {
    let slider = UISlider(frame: CGRect(x: 10, y: 100, width: 300, height: 20))
      slider.accessibilityIdentifier = "drawAgentsSlider"
      slider.minimumValue = 0
      slider.maximumValue = 5
      slider.value = 0
      slider.tintColor = Colors.dark
      slider.isContinuous = true
      slider.translatesAutoresizingMaskIntoConstraints = true
      slider.addTarget(self, action: #selector(sliderValueDidChange(_:)), for: .valueChanged)
      return slider
    }()

  lazy var button: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.backgroundColor = Colors.dark
    button.setTitleColor(.white, for: .normal)
    button.addTarget(self, action: #selector(didTaped(_:)), for: .touchUpInside)
    button.tag = 1
    button.setTitle("LOSUJ", for: .normal)
    button.layer.cornerRadius = 30
    return button
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.setGradientBackground(colorOne: Colors.red, colorTwo: Colors.dark)
    setupSlider()
    setupLabel()
    setupButom()
    setupDrawAgentsContainers()
    setupMainContainer()
    loadContainers()
  }

  @objc func didTaped(_ sender: UIButton) {
    presenter?.startDrawingAgents(start: true)
    loadAnimationOfMainContainerBasedOnNumberOfAgentes()
  }

  @objc func sliderValueDidChange(_ sender: UISlider) {
    mainLabel.text = "Liczba wybranych agentów: " + String(Int(sender.value))
    presenter?.getNumberOfAgents(number: Int(sender.value))
    numberOfDrewdAgents = Int(sender.value) 
  }

  func update(with agent: [Agent]) {
    let number = numberOfDrewdAgents - 1
    let containersForAssignmentData = makeListOfContainers()[...number]
    loadContainers()
    for (number, element) in containersForAssignmentData.enumerated() {
      element.isHidden = false
      element.agentIconImage.loadFrom(URLAddress: agent[number].displayIconSmall)
      element.agentNameLabel.text = agent[number].displayName
    }
  }

  func makeListOfContainers() -> [DrawAgentsContainer] {
    let containers = [
      firstAgentContainer,
      secondAgentContainer,
      thirdAgentContainer,
      fourthAgentContainer,
      fifthAgentContainer
    ]
      return containers
  }

  func loadContainers() {
    let containers = makeListOfContainers()
    for container in containers {
      container.isHidden = true
    }
  }

  func animationOfMainContainer(offset: Int) {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 0.5, delay: 0.0125) {
      self.mainContainer.snp.updateConstraints { make in
        make.centerY.equalTo(self.view.snp_centerYWithinMargins).offset(offset)
      }
        self.view.layoutIfNeeded()
    }
  }

  func loadAnimationOfMainContainerBasedOnNumberOfAgentes() {
    switch numberOfDrewdAgents {
    case 0:
      loadContainers()
      animationOfMainContainer(offset: 0)
    case 1:
      animationOfMainContainer(offset: -210)
    case 2:
      animationOfMainContainer(offset: -105)
    case 3:
      animationOfMainContainer(offset: 10)
    case 4:
      animationOfMainContainer(offset: 150)
    case 5:
      animationOfMainContainer(offset: 220)
    default:
      animationOfMainContainer(offset: 0)
    }
  }

  func setupMainContainer() {
    view.addSubview(mainContainer)
    mainContainer.snp.makeConstraints { make in
      make.width.equalToSuperview()
      make.height.equalTo(300)
      make.centerX.equalToSuperview()
      make.centerY.equalTo(self.view.snp_centerYWithinMargins).offset(0)
    }
  }

  func setupEachOfDrawAgentsContainers(name: DrawAgentsContainer, offset: Int) {
    view.addSubview(name)
    name.backgroundColor = .gray
    name.snp.makeConstraints { make in
      make.width.equalToSuperview()
      make.height.equalTo(75)
      make.topMargin.equalToSuperview().offset(offset)
    }
  }

  func setupDrawAgentsContainers() {
    setupEachOfDrawAgentsContainers(name: firstAgentContainer, offset: 35)
    setupEachOfDrawAgentsContainers(name: secondAgentContainer, offset: 145)
    setupEachOfDrawAgentsContainers(name: thirdAgentContainer, offset: 255)
    setupEachOfDrawAgentsContainers(name: fourthAgentContainer, offset: 365)
    setupEachOfDrawAgentsContainers(name: fifthAgentContainer, offset: 475)
  }

  func setupSlider() {
    mainContainer.addSubview(slider)
    slider.centerXAnchor.constraint(equalTo: mainContainer.centerXAnchor).isActive = true
    slider.centerYAnchor.constraint(equalTo: mainContainer.centerYAnchor).isActive = true
    slider.widthAnchor.constraint(equalTo: mainContainer.widthAnchor, multiplier: 0.5).isActive = true

    slider.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.centerY.equalToSuperview()
    }
  }

  func setupLabel() {
    mainContainer.addSubview(mainLabel)
    mainLabel.text = "Liczba wybranych agentów: 0"
    mainLabel.font = .boldSystemFont(ofSize: 26)
    mainLabel.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.centerY.equalTo(slider).offset(40)
    }
  }

  func setupButom() {
    mainContainer.addSubview(button)
    button.snp.makeConstraints { make in
      make.width.equalTo(150)
      make.height.equalTo(75)
      make.centerX.equalToSuperview()
      make.centerY.equalTo(mainLabel).offset(75)
    }
  }
}
