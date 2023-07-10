import Foundation
import Combine

final class HomeRepository: HomeRepositoryContract {
  private let networkService: NetworkService
  
  init(networkService: NetworkService = NetworkService()) {
    self.networkService = networkService
  }
  
  func getMovies(by filter: Constants.MoviesFilter? = nil) -> AnyPublisher<Movies?, MAError> {
    guard let url = URL(string: Constants.baseURL) else {
      return Fail(error: MAError.invalidURL).eraseToAnyPublisher()
    }
    
    let request = NetworkRequestBuilder()
      .setURL(url)
      .setQueryParameters(key: filter == nil ? nil : .sortBy, value: filter?.rawValue ?? "")
      .setQueryParameters(key: .apiKey, value: Constants.apiKey)
      .build()
    
    return networkService.fetch(request: request)
      .eraseToAnyPublisher()
  }
}
