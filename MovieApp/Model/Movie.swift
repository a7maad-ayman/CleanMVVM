//
//  Movie.swift
//  MovieApp
//
//  Created by ahmad on 04/07/2023.
//

import Foundation

struct Movies: Decodable {
    let results: [Movie]
    let totalPages, totalResults, page: Int

    enum CodingKeys: String, CodingKey {
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
        case page
    }
}

struct Movie: Codable {
    let genreIDS: [Int]
    let adult: Bool
    let backdropPath: String?
    let id: Int
    let originalTitle: String
    let voteAverage, popularity: Double
    let posterPath, overview, title, originalLanguage: String?
    let voteCount: Int
    let releaseDate: String
    let video: Bool

    enum CodingKeys: String, CodingKey {
        case genreIDS = "genre_ids"
        case adult
        case backdropPath = "backdrop_path"
        case id
        case originalTitle = "original_title"
        case voteAverage = "vote_average"
        case popularity
        case posterPath = "poster_path"
        case overview, title
        case originalLanguage = "original_language"
        case voteCount = "vote_count"
        case releaseDate = "release_date"
        case video
    }
}
