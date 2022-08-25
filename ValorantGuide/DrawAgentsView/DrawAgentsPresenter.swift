import Foundation

class DrawAgentsPresenter: PresenterProtocol {

  var interactor: InteractorProtocol? 
  var router: RouterProtocol?
  var view: ViewProtocol?

  func getDrawAgents(randomAgent: [Agent]) {
    view?.update(with: randomAgent)
  }

  func getNumberOfAgents(number: Int) {
    interactor?.getNumberOfAgents(number: number)
  }

  func startDrawingAgents(start: Bool) {
    interactor?.sendDrewAgents(start: start)
  }
}
