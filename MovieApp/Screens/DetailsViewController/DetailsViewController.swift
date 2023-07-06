
//
//  DetailsViewController.swift
//  MovieApp
//
//  Created by ahmad on 05/07/2023.
//

import UIKit

class DetailsViewController: UIViewController {
  
  //MARK: - IBoutlets
  @IBOutlet private (set) weak var posterImageView: UIImageView!
  @IBOutlet private (set) weak var favoriteImageView: UIImageView!
  @IBOutlet private (set) weak var rateLabel: UILabel!
  @IBOutlet private (set) weak var titleLabel: UILabel!
  @IBOutlet private (set) weak var overViewTextView: UITextView!
  
  //MARK: - Properties
  private var viewModel: DetailsViewModel
  
  init(viewModel:DetailsViewModel){
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  //MARK: - Initializers
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    configureView()
  }
  
  private func configureView() {
    let movie = viewModel.getMovieDetails()
    rateLabel.text = String(describing:movie.voteAverage)
    titleLabel.text = movie.originalTitle
    overViewTextView.text = movie.overview
    posterImageView.setImage(with: viewModel.getImageUrl())
    view.backgroundColor = .systemBackground
  }
}
