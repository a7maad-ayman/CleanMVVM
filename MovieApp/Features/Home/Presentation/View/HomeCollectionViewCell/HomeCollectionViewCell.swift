import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

  //MARK: - IBOutlets
     @IBOutlet private (set) weak var movieUIImage: UIImageView!
    
  //MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        movieUIImage.layer.cornerRadius = 10
    }
    
    func set(movie:Movie?) {
      guard let movie else { return }
        guard let path = movie.posterPath else {
            movieUIImage.image = UIImage(named: Constants.imagePlaceholder)
            return
        }
        movieUIImage.setImage(with: Constants.imageBaseUrl + path)
    }
}
