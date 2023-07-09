//
//  GetMoviesUseCase.swift
//  MovieApp
//
//  Created by ahmad on 09/07/2023.
//

import Foundation

protocol GetMoviesUseCaseContract {
  func execute(by filter:Constants.MoviesFilter?, handler: @escaping (Movies?)->Void)
}

class GetMoviesUseCase: GetMoviesUseCaseContract {
  private let homeRepository: HomeRepositoryContract
  
  init(homeRepository: HomeRepositoryContract = HomeRepository()) {
    self.homeRepository = homeRepository
  }
  
  func execute(by filter:Constants.MoviesFilter? = nil, handler: @escaping (Movies?)->Void){
    homeRepository.getMovies(by: filter, handler: handler)
  }
}
