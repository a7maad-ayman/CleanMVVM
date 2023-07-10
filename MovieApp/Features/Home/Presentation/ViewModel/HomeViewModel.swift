import Foundation
import Combine

final class HomeViewModel: HomeViewModelContract{

  private let getMoviesUseCase: GetMoviesUseCaseContract
  private var allMovies: [Movie]?
  var reload: (() -> Void)?
  private var cancellables: Set<AnyCancellable> = []

  init(getMoviesUseCase: GetMoviesUseCaseContract = GetMoviesUseCase()) {
    self.getMoviesUseCase = getMoviesUseCase
  }

  var moviesCount: Int {
    allMovies?.count ?? 0
  }

  func getItem(at index: Int) -> Movie? {
    guard let allMovies = allMovies else { return nil }
    return allMovies[index]
  }

  func getMovies(by filter: Constants.MoviesFilter? = nil) {
    getMoviesUseCase.execute(by: filter)
      .sink(receiveCompletion: { completion in
        if case let .failure(error) = completion {
          print("Error: \(error.localizedDescription)")
        }
      }, receiveValue: { [weak self] movies in
        self?.allMovies = movies?.results
        self?.reload?()
      })
      .store(in: &cancellables)
  }
}
