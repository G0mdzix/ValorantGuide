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
    var titlesList = [Titles]()
    let allTitles = Common.generateDataTitlesList()
    for item in allTitles {
      titlesList.append(Titles(attributes: item))
    }
    return titlesList
  }
  
  func getSelectionTitles() -> [SelectionTitles] {
    var selectionTitlesList = [SelectionTitles]()
    let allSelectionTitles = Common.generateDataSelecitonTitlesList()
    for item in allSelectionTitles {
      selectionTitlesList.append(SelectionTitles(attributes: item))
    }
    return selectionTitlesList
  }
}
