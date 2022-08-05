import Foundation
import UIKit
import SnapKit

class AgentsDetailViewController: UIViewController, AgentsDetailView {

    var presenter: AgentsDetailPresenter?
    var agent: Agent?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradientBackground(colorOne: Colors.red, colorTwo: Colors.dark)
        setupView()
        presenter?.viewDidLoad()
    }

    func showAgentDetail(with agent: Agent) {
        agentNameLabel.text = agent.displayName
    }
    
    let agentNameLabel:UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupView(){
        
        view.addSubview(agentNameLabel)
        
        agentNameLabel.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}
