import Foundation
import Combine

protocol HomeViewModelContract {
  var moviesCount: Int { get }
  func getItem(at index: Int) -> Movie?
  func getMovies(by filter: Constants.MoviesFilter?)
}
