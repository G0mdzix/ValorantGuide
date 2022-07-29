//
//  Interactor.swift
//  ValorantGuide
//
//  Created by Mateusz Gozdzik on 29/07/2022.
//
// https://jsonplaceholder.typicode.com/users
// https://valorant-api.com/v1/agents
import Foundation

protocol AnyInteractor {
    var presenter: AnyPresenter? {get set}
    
    func getUsers()
}

class UserInteractor: AnyInteractor {
    var presenter: AnyPresenter?
    
    func getUsers() {
        print("fetchingAgentList")
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {return}
        let task = URLSession.shared.dataTask(with: url) {[weak self] data, _, error in
            guard let data = data, error == nil else {
                self?.presenter?.interactprDidFetchUsers(with: .failure(FetchError.failed))
                return
            }
            do {
                let etities = try JSONDecoder().decode([User].self, from: data)
                
                self?.presenter?.interactprDidFetchUsers(with: .success(etities))
            }
            catch {
                self?.presenter?.interactprDidFetchUsers(with: .failure(error))
            }
        }
        task.resume()
    }
    
    
}
