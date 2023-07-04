//
//  NetworkService.swift
//  MovieApp
//
//  Created by ahmad on 04/07/2023.
//

import UIKit

final class NetworkService {
    static let shared = NetworkService()
    let cache = NSCache<NSString,UIImage> ()
    private init(){}
    
    func getMovies(from endPoint: String ,completion: @escaping (Result<Movies,MAError>) -> Void ) {

        guard let url = URL(string: endPoint) else {
            completion(.failure(.invalidURL))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(.unableToComplete))
            }
            guard let response = response as? HTTPURLResponse , response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let movies = try decoder.decode(Movies.self, from: data)
                completion(.success(movies))
            } catch {
                completion(.failure(.invalidData))
            }
        }
       task.resume()
    }
    
}
