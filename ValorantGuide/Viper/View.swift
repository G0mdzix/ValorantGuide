//
//  View.swift
//  ValorantGuide
//
//  Created by Mateusz Gozdzik on 29/07/2022.
//

import Foundation
import UIKit

protocol AnyView {
    var presenter: AnyPresenter? {get set}
    
    func update(with users: [User])
    func update(with error: String)
}

class UserViewController: UIViewController, AnyView, UITableViewDelegate, UITableViewDataSource{
  
    
    var presenter: AnyPresenter?
    
    private let tableView: UITableView = {
       let table = UITableView()
        table.register(UITableViewCell.self,
                       forCellReuseIdentifier: "cell")
        table.isHidden = true
        return table
    }()
    
    var users: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func update(with users: [User]){
        print("OK")
        DispatchQueue.main.sync {
            self.users = users
            self.tableView.reloadData()
            self.tableView.isHidden = false
        }
    }
    func update(with error: String){
        print(error)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = users[indexPath.row].name
        return cell
        //UITableViewCell()
    }
}

