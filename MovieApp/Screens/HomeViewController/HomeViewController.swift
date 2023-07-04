//
//  HomeViewController.swift
//  MovieApp
//
//  Created by ahmad on 04/07/2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    //MARK: - Properties
    var movies:Movies?
    let endPoint = "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.%20desc&api_key=1e95a9686ab126555e6f5df2ed967f7a"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        NetworkService.shared.getMovies(from: endPoint, completion: { result in
            switch result {
            case .success(let movieArray):
                self.movies = movieArray
            case .failure(let error):
                // Handle the error, if needed
                print("Error: \(error.rawValue)")
            }
        })
       
    }
}

