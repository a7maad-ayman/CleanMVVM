import Foundation
final class HomeViewModel {
  
  private let networkService = NetworkService.shared
  private var allMovies: [Movie]?
  
  var reload: (() -> Void)?

  var numberOfRows: Int {
    allMovies?.count ?? 0
  }
  
  func getItem(at index: Int) -> Movie? {
    guard let allMovies else { return nil }
    return allMovies[index]
  }
  
  func getMovies(by filter:String? = nil) {
    var endPoint:String?
    if filter == Constants.mostViewed {
      endPoint = Constants.endPointForMostViewed
    } else if filter == Constants.popularity {
      endPoint = Constants.endPointForPopularity
    }else{
      endPoint = Constants.endPoint
    }
    networkService.getMovies(from: endPoint ?? Constants.endPoint) { [weak self] result in
      guard let self else {return}
      switch result {
      case .success(let movies):
        self.allMovies = movies.results
        self.reload?()
      case .failure(let error):
        print("Error: \(error.rawValue)")
      }
    }
  }
}
