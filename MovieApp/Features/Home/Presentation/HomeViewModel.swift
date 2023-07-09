import Foundation

final class HomeViewModel {
  
  private let getMoviesUseCase: GetMoviesUseCaseContract
  private var allMovies: [Movie]?
  var reload: (() -> Void)?
  
  init(getMoviesUseCase: GetMoviesUseCaseContract = GetMoviesUseCase()) {
    self.getMoviesUseCase = getMoviesUseCase
  }
  
  var moviesCount: Int {
    allMovies?.count ?? 0
  }
  
  func getItem(at index: Int) -> Movie? {
    guard let allMovies else { return nil }
    return allMovies[index]
  }
  
  func getMovies(by filter:Constants.MoviesFilter? = nil) {
    getMoviesUseCase.execute(by: filter) { [weak self] movies in
      self?.allMovies = movies?.results
      self?.reload?()
    }
  }
}
