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
  
  var getImageUrl: String{
    guard let path = movie.posterPath else { return "" }
    let url = Constants.imageBaseUrl+path
    return url
  }
  
  var rate: String{
    return String(describing:movie.voteAverage)
  }
  
  var title: String{
    return movie.originalTitle
  }
  
  var description: String{
    return movie.overview ?? ""
  }
}

