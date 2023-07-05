import Foundation
final class HomeViewModel {
   
    private let networkService = NetworkService.shared
    private var onReloadNeeded: (() -> Void) = {}
    var allMovies: [Movie] = [] {
        didSet {
            onReloadNeeded()
        }
    }
    
    func configureOnReloadNeeded(onReloadNeeded: @escaping () -> Void) {
        self.onReloadNeeded = onReloadNeeded
    }
    
    func numberOfRows() -> Int {
        allMovies.count
    }
    
    func getMovies() {
        networkService.getMovies(from: Constants.endPoint) { [weak self] result in
            guard let self else {return}
            switch result {
            case .success(let movies):
                self.allMovies = movies.results ?? []
            case .failure(let error):
                print("Error: \(error.rawValue)")
            }
        }
    }
}
