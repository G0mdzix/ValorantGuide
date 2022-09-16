import XCTest
@testable import ValorantGuide

class DrawAgentsInteractorUnitTests: XCTestCase {

  var drawInteractor: DrawAgentsInteractor?

  override func setUp() {
    super.setUp()
    drawInteractor = DrawAgentsInteractor()
    drawInteractor?.agents = DummyAgents.agents
  }

  override func tearDown() {
    super.tearDown()
  }

  func test_unique_draw_of_agents() {
    let numberOfAgentsInStructure = 4
    let numberOfUniqueAgentsInStructure = 3
    let uniqueDrawedAgents = drawInteractor?.drawAgents(number: numberOfAgentsInStructure)
    XCTAssertEqual(uniqueDrawedAgents?.count, numberOfUniqueAgentsInStructure)
  }
}
