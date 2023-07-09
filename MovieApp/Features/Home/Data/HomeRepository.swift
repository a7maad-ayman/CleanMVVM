//
//  HomeRepository.swift
//  MovieApp
//
//  Created by ahmad on 09/07/2023.
//

import Foundation

protocol HomeRepositoryContract {
  func getMovies(by filter: Constants.MoviesFilter?, handler: @escaping (Movies?)->Void)
}

final class HomeRepository: HomeRepositoryContract{
  private let networkService: NetworkService
  
  init(networkService: NetworkService = NetworkService()) {
    self.networkService = networkService
  }
  
  func getMovies(by filter: Constants.MoviesFilter? = nil , handler: @escaping (Movies?)->Void) {
    guard let url = URL(string: Constants.baseURL) else { return }
    let request = NetworkRequestBuilder()
      .setURL(url)
      .setQueryParameters(key: filter == nil ? nil : .sortBy, value: filter?.rawValue ?? "")
      .setQueryParameters(key: .apiKey, value: Constants.apiKey)
      .build()
    
    networkService.fetch(request: request) { [weak self] (result: Result<Movies?, MAError>) in
      guard let self else {return}
      switch result {
      case .success(let movies):
        handler(movies)
      case .failure(let error):
        print("Error: \(error.rawValue)")
      }
    }
  }
  
}
