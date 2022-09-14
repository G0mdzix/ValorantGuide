import Foundation

class MainViewInteractor: MainInteractor {
    
  var presenter: MainPresenter?
  
  func getTitlesList() {
    presenter?.titlesListDidFetch(with: .success(getTitles()))
  }

  func getSectionTitles() {
    presenter?.selectionTitlesListDidFetch(with: .success(getSelectionTitles()))
  }

  func getTitles() -> [Titles] {
    var titlesList: [Titles] = []
    let allTitles = Common.generateDataTitlesList()
      allTitles.map { element in
      titlesList.append(Titles(attributes: element))
      }
    return titlesList
  }
  
  func getSelectionTitles() -> [SelectionTitles] {
    var selectionTitlesList: [SelectionTitles] = []
    let allSelectionTitles = Common.generateDataSelecitonTitlesList()
      allSelectionTitles.map { element in
      selectionTitlesList.append(SelectionTitles(attributes: element))
      }
    return selectionTitlesList
  }
}
