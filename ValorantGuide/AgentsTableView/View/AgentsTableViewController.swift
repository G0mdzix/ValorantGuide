import Foundation
import UIKit

class AgentsTableViewController: UIViewController, AgentView, UITableViewDelegate, UITableViewDataSource {
  
  var presenter: AgentPresenter?
  var agents: [Agent] = []

  private let tableView: UITableView = {
    let table = UITableView()
    table.register(AgentsTableViewCell.self, forCellReuseIdentifier: K.agentsTableViewCell)
    table.isHidden = true
    return table
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(tableView)
    tableView.backgroundColor = Colors.red
    tableView.delegate = self
    tableView.dataSource = self
  }
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    tableView.frame = view.bounds
  }

  func update(with agents: [Agent]) {
    DispatchQueue.main.sync {
      self.agents = agents
      self.tableView.reloadData()
      self.tableView.isHidden = false
    }
  }

  func update(with error: String) {
    print(error)
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return agents.count
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 220
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(
      withIdentifier: K.agentsTableViewCell,
      for: indexPath
    )
      as? AgentsTableViewCell else {
      return UITableViewCell()
    }
    cell.agentNameLabel.text = agents[indexPath.row].displayName
    cell.agentTitleDetailedLabel.text = agents[indexPath.row].role?.displayName
    cell.agentDescritpionLabel.text = agents[indexPath.row].description
    cell.agentIconImageView.loadFrom(URLAddress: agents[indexPath.row].displayIconSmall)
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let navigationController = navigationController {
      presenter?.showAgentsDetailController(with: agents[indexPath.row], navigationController: navigationController)
    }
  }
}
