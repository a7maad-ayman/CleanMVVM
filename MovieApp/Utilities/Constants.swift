import Foundation

final class Constants {
    static let apiKey = "1e95a9686ab126555e6f5df2ed967f7a"
    static let imageBaseUrl = "https://image.tmdb.org/t/p/w185/"
    
  // note [aziz]: add query parameter to the base url instead of duplicating the same url 3 times
  // note [aziz]: this is a url not and end point
    static let endPoint = "https://api.themoviedb.org/3/discover/movie?&api_key=1e95a9686ab126555e6f5df2ed967f7a"
  // note [aziz]: this is a url not and end point
    static let endPointForPopularity = "https://api.themoviedb.org/3/discover/movie?per_page=100&sort_by=popularity&api_key=1e95a9686ab126555e6f5df2ed967f7a"
  // note [aziz]: this is a url not and end point
    static let endPointForMostViewed = "https://api.themoviedb.org/3/discover/movie?per_page=100&sort_by=most_viewed&api_key=1e95a9686ab126555e6f5df2ed967f7a"
  
  // note [aziz]: palceholder is a wrong spelling
    static let imagePlaceholder = "palceholder"
    
    static let mostViewed = "MostViewed"
    static let popularity = "Popularity"
}
