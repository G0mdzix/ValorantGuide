import Foundation

class DrawAgentsInteractor: InteractorProtocol {

  var presenter: PresenterProtocol?
  var numberOfDrawAgents: Int = 0
  var agents: [Agent] = []
  
  var agentInteractor: AgentsInteractor? {
    didSet {
      agentInteractor?.getUsers()
    }
  }
  
  func interactorDidFetchAgents(with result: Result<[Agent], Error>) {
    switch result {
    case .success(let agent):
      agents = agent
    case .failure:
      print("Something went wrong")
    }
  }

  func drawAgents(number: Int) -> [Agent] {
    var drewListOfAgents: [Agent] = []
    var uniqueSetOfAgents = Set(drewListOfAgents)
    if number > 0 {
      for _ in 1...number {
        if let randomAgent = agents.randomElement() {
          drewListOfAgents.append(randomAgent)
          uniqueSetOfAgents.insert(randomAgent)
          if uniqueSetOfAgents.contains(randomAgent) {
            if let subRandomAgent = agents.randomElement() {
              uniqueSetOfAgents.insert(subRandomAgent)
            }
          }
        }
      }
    }
    let uniqueArrayOfAgents = Array(uniqueSetOfAgents)
    return uniqueArrayOfAgents
  }

  func sendDrewAgents(start: Bool) {
    if start == true {
      switch numberOfDrawAgents {
      case 1...5:
        presenter?.getDrawAgents(randomAgent: drawAgents(number: numberOfDrawAgents))
      default:
        print("none agent selected")
      }
    }
  }

  func getNumberOfAgents(number: Int) {
    numberOfDrawAgents = number
    drawAgents(number: number)
  }
}
