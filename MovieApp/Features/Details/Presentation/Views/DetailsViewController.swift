
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
    rateLabel.text = viewModel.rate
    titleLabel.text = viewModel.title
    overViewTextView.text = viewModel.description
    posterImageView.setImage(with: viewModel.getImageUrl)
    view.backgroundColor = .systemBackground
  }
}
