import UIKit
// note [aziz]: every cell should be in same group as it's corresponding module, this cell should be in home group
class HomeCollectionViewCell: UICollectionViewCell {
  // note [aziz]:make private
    @IBOutlet weak var movieUIImage: UIImageView!
    
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
