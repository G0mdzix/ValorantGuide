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
        let random = agents.randomElement()!
        drewListOfAgents.append(random)
        uniqueSetOfAgents.insert(random)
        if uniqueSetOfAgents.contains(random) {
          uniqueSetOfAgents.insert(agents.randomElement()!)
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
