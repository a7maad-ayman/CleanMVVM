import Foundation
final class HomeViewModel {
  
  private let networkClient = NetworkService()
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
    guard let url = URL(string: Constants.baseURL) else { return }
    let request = NetworkRequestBuilder()
      .setURL(url)
      .setQueryParameters(key: filter == nil ? nil : .sortBy, value: filter?.rawValue ?? "")
      .setQueryParameters(key: .apiKey, value: Constants.apiKey)
      .build()
    
    networkClient.fetch(request: request) {[weak self] (result: Result<Movies?, MAError>) in
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



