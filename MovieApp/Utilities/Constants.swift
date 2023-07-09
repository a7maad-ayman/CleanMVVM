import Foundation

final class Constants {
  static let apiKey = "1e95a9686ab126555e6f5df2ed967f7a"
  static let imageBaseUrl = "https://image.tmdb.org/t/p/w185/"
  static let baseURL = "https://api.themoviedb.org/3/discover/movie?per_page=100"
  enum MoviesFilter: String{
    case mostViewed = "MostViewed"
    case popularity = "Popularity"
  }
  static let imagePlaceholder = "placeholder"
  
}
