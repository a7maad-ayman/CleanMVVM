import Foundation
final class HomeViewModel {
    var movies:Movies?
    
   private let endPoint = "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.%20desc&api_key=1e95a9686ab126555e6f5df2ed967f7a"
    
    private let network = NetworkService.shared
    
    func showMovies() {
        network.getMovies(from: endPoint ,completion: { [weak self] result in
            guard let self else {return}
            switch result {
            case .success(let movieArray):
                self.movies = movieArray
                print(self.movies?.results?.count)
            case .failure(let error):
                // Handle the error, if needed
                print("Error: \(error.rawValue)")
            }
        })
    }
}
