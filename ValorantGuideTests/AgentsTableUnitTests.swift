import XCTest
@testable import ValorantGuide

class AgentsTableUnitTests: XCTestCase {

  var presenter: AgentsPresenter?

  override func setUp() {
    super.setUp()
    presenter = AgentsPresenter()
    presenter?.agents = DummyAgents.agents
  }

  override func tearDown() {
    super.tearDown()
  }

  func test_counting_agents() {
    let numberOfAgentsItemsFromFunction = presenter?.numberOfAgentItems()
    let countArrayOfAgents = presenter?.agents.count
    XCTAssertEqual(numberOfAgentsItemsFromFunction, countArrayOfAgents)
  }
}
