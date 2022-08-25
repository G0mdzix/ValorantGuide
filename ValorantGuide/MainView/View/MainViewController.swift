import Foundation
import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,
                          MainView, MainTableViewCellDelegate {
    
    var presenter: MainPresenter?
    var titles: [Titles] = []
    var sectionTitles: [SelectionTitles] = []
  
    private let mainFeedTable: UITableView = {
        let table = UITableView()
        table.register(MainViewTableViewCell.self, forCellReuseIdentifier: K.mainTableViewCell)
        return table
    }()

  override func viewDidLoad() {
    super.viewDidLoad()
    loadHeader()
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    mainFeedTable.frame = view.bounds
  }

    func update(with error: String) {
      print(error)
    }
    
    func update(with titles: [Titles]) {
      self.titles = titles
      self.mainFeedTable.reloadData()
    }

    func passTheCurrent(tableIndex: Int, collectionViewIndex: Int) {
      if let navigationController = navigationController {
        presenter?.showController(
          tableIndex: tableIndex,
          collectionViewIndex: collectionViewIndex,
          navigationController: navigationController
        )
    }
  }

    func updateSelectionTitles(with sectionTitles: [SelectionTitles]) {
      self.sectionTitles = sectionTitles
    }

    func loadHeader() {
      view.addSubview(mainFeedTable)
      mainFeedTable.delegate = self
      mainFeedTable.dataSource = self
      let headerView = MainHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 250))
      mainFeedTable.tableHeaderView = headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 1
    }

    func numberOfSections(in tableView: UITableView) -> Int {
      return sectionTitles.count
    }

    func divideDataBySections(cell: MainViewTableViewCell, indexPath: IndexPath) {
      switch indexPath.section {
      case Sections.guides.rawValue:
        cell.configure(with: titles.map { $0.guides })
      case Sections.visualThings.rawValue:
        cell.configure(with: titles.map { $0.visualThings })
      case Sections.gameAid.rawValue:
        cell.configure(with: titles.map { $0.gameAid })
      default:
        print("")
      }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      guard let cell = tableView.dequeueReusableCell(
        withIdentifier: K.mainTableViewCell,
        for: indexPath
      )
      as? MainViewTableViewCell else {
        return UITableViewCell()
      }
      divideDataBySections(cell: cell, indexPath: indexPath)
      cell.delegate = self
      cell.index = indexPath.section
      return cell
      }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 250
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
      return 40
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
      return sectionTitles[section].sectionTitles
    }
}

enum Sections: Int {
  case guides = 0
  case visualThings = 1
  case gameAid = 2
}
