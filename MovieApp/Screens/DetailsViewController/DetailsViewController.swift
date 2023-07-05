
//
//  DetailsViewController.swift
//  MovieApp
//
//  Created by ahmad on 05/07/2023.
//

import UIKit

class DetailsViewController: UIViewController {
     
    //MARK: - Init
    
    
    //MARK: - IBoutlets
  // note [aziz]: make private
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var favoriteImageView: UIImageView!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overViewTextView: UITextView!
    
    //MARK: - Properties
  // note [aziz]: make private
    var viewModel: DetailsViewModel
    
    init(viewModel:DetailsViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureData()
    }
    
  // note [aziz]: make private
  // note [aziz]: rename method, it's configuring view not data 
    func configureData() {
      // note [aziz]: return final value only from view model
      // note [aziz]: this method has many responsibilities
        rateLabel.text = String(describing:viewModel.movie.voteAverage)
        titleLabel.text = viewModel.movie.originalTitle
        overViewTextView.text = viewModel.movie.overview
        view.backgroundColor = .systemBackground
        guard let path = viewModel.movie.posterPath else {
            posterImageView.image = UIImage(named: Constants.imagePlaceholder)
            return }
        posterImageView.setImage(with: Constants.imageBaseUrl+path)
    }
  // note [aziz]: remove this mark

    //MARK: - IBActions
    
}
