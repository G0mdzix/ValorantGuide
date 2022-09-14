import Foundation
import UIKit

class AgentsTableViewController: UIViewController, AgentView, UITableViewDelegate, UITableViewDataSource {
  
  var presenter: AgentPresenter?
  let heightForRow: CGFloat = 220

  private let tableView: UITableView = {
    let table = UITableView()
    table.register(AgentsTableViewCell.self, forCellReuseIdentifier: K.agentsTableViewCell)
    table.isHidden = false
    return table
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(tableView)
    tableView.backgroundColor = Colors.red
    tableView.delegate = self
    tableView.dataSource = self
    self.tableView.reloadData()
  }
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    tableView.frame = view.bounds
  }

  func update(with error: String) {
    self.tableView.isHidden = true
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let presenter = presenter else { return 0 }
    return presenter.numberOfAgentItems()
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return heightForRow
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(
      withIdentifier: K.agentsTableViewCell,
      for: indexPath
    )
      as? AgentsTableViewCell else {
      return UITableViewCell()
    }
    guard let presenter = presenter else { return UITableViewCell() }
    cell.agentNameLabel.text = presenter.agentItem(at: indexPath.row).name
    cell.agentTitleDetailedLabel.text = presenter.agentItem(at: indexPath.row).roleName
    cell.agentDescritpionLabel.text = presenter.agentItem(at: indexPath.row).description
    cell.agentIconImageView.loadFrom(URLAddress: presenter.agentItem(at: indexPath.row).icon)
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let presenter = presenter else { return }
    if let navigationController = navigationController {
      presenter.showAgentsDetailController(
        with: presenter.agentItem(at: indexPath.row),
        navigationController: navigationController
      )
    }
  }
}
