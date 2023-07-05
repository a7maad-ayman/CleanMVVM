import Foundation

final class Constants {
    static let apiKey = "1e95a9686ab126555e6f5df2ed967f7a"
    static let imageBaseUrl = "https://image.tmdb.org/t/p/w185/"
    
    static let endPoint = "https://api.themoviedb.org/3/discover/movie?&api_key=1e95a9686ab126555e6f5df2ed967f7a"
    
    static let endPointForPopularity = "https://api.themoviedb.org/3/discover/movie?per_page=100&sort_by=popularity&api_key=1e95a9686ab126555e6f5df2ed967f7a"
    
    static let endPointForMostViewed = "https://api.themoviedb.org/3/discover/movie?per_page=100&sort_by=most_viewed&api_key=1e95a9686ab126555e6f5df2ed967f7a"
    static let imagePlaceholder = "palceholder"
    
    static let mostViewed = "MostViewed"
    static let popularity = "Popularity"
}
