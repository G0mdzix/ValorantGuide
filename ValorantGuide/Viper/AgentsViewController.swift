import Foundation
import UIKit

class AgentsViewController: UIViewController, AgentView, UITableViewDelegate, UITableViewDataSource{
  
    var presenter: AgentPresenter?
    var agents: [Agent] = []
    
    private let tableView: UITableView = {
       let table = UITableView()
        table.register(UITableViewCell.self,
                       forCellReuseIdentifier: K.cell)
        table.isHidden = true
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func update(with agents: [Agent]){
        DispatchQueue.main.sync {
            self.agents = agents
            self.tableView.reloadData()
            self.tableView.isHidden = false
        }
    }
    func update(with error: String){
        print(error)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return agents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cell, for: indexPath)
        cell.textLabel?.text = agents[indexPath.row].displayName
        cell.textLabel?.text = agents[indexPath.row].developerName
        return cell
    }
}
