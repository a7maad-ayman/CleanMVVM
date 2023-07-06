//
//  DetailsViewModel.swift
//  MovieApp
//
//  Created by ahmad on 05/07/2023.
//

import Foundation

final class DetailsViewModel {
  
  //MARK: - Properties
  private var movie: Movie
  
  //MARK: - Initializers
  init(movie: Movie) {
    self.movie = movie
  }
  
  func getMovieDetails() -> Movie{
    return movie
  }
  
  func getImageUrl() -> String {
    guard let path = movie.posterPath else { return "" }
    let url = Constants.imageBaseUrl+path
    return url
  }
}

