import Foundation

protocol LoadingScreenRouterProtocol {
  var entry: EntryPointLoadingScreen? { get }
  static func start() -> LoadingScreenRouterProtocol
}

protocol LoadingScreenViewProtocol {
  var presenter: LoadingScreenPresenterProtocol? { get set }
}

protocol LoadingScreenPresenterProtocol {
  var router: LoadingScreenRouterProtocol? { get set }
  var view: LoadingScreenViewProtocol? { get set }
}
