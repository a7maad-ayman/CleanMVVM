//
//  DetailsViewModel.swift
//  MovieApp
//
//  Created by ahmad on 05/07/2023.
//

import Foundation
// note [aziz]: move view controller logic here

final class DetailsViewModel {
  // note [aziz]: make private
    var movie:Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
   
}
