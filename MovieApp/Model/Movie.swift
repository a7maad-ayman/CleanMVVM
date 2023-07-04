//
//  Movie.swift
//  MovieApp
//
//  Created by ahmad on 04/07/2023.
//

import Foundation
struct Movie: Decodable {
    let adult: Bool
    let id: Int
    let originalLanguage, originalTitle, overview: String
    let popularity: Int
    let posterPath: String?
    let releaseDate, title: String
    let video: Bool
    let voteAverage, voteCount: Int
}

struct Movies: Decodable {
    let results:[Movie]?
}
