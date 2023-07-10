import Foundation
import Combine

protocol HomeRepositoryContract {
  func getMovies(by filter: Constants.MoviesFilter?) -> AnyPublisher<Movies?, MAError>
}
