import Foundation
final class HomeViewModel {
  
  private let networkService = NetworkService.shared
  private var allMovies: [Movie]?
  
  var reload: (() -> Void)?
  
  var numberOfRows: Int {
    allMovies?.count ?? 0
  }
  
  func getItem(at index: Int) -> Movie? {
    guard let allMovies else { return nil }
    return allMovies[index]
  }
  
  func getMovies(by filter:Constants.MoviesFilter? = nil) {
    let url = Constants.baseURL + (filter?.rawValue ?? "") + Constants.apiKey
    networkService.fetch(from: url) { [weak self] (result: Result<Movies?, MAError>) in
      guard let self else {return}
      switch result {
      case .success(let movies):
        self.allMovies = movies?.results
        self.reload?()
      case .failure(let error):
        print("Error: \(error.rawValue)")
      }
    }
  }
}


