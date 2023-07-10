import Foundation
import Combine

//MARK: -  GetMoviesUseCaseContract protocol
protocol GetMoviesUseCaseContract {
  func execute(by filter: Constants.MoviesFilter?) -> AnyPublisher<Movies?, Error>
}


//MARK: -  GetMoviesUseCaseContract class
final class GetMoviesUseCase: GetMoviesUseCaseContract {
  private let homeRepository: HomeRepositoryContract
  
  init(homeRepository: HomeRepositoryContract = HomeRepository()) {
    self.homeRepository = homeRepository
  }
  
  func execute(by filter: Constants.MoviesFilter? = nil) -> AnyPublisher<Movies?, Error> {
    return homeRepository.getMovies(by: filter)
      .mapError { error -> Error in
        print("Error\(error.localizedDescription)")
        return error
      }
      .eraseToAnyPublisher()
  }
}
