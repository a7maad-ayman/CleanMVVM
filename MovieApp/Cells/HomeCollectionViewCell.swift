import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var movieUIImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        movieUIImage.layer.cornerRadius = 10
    }
    
    func set(movie:Movie){
        guard let path = movie.posterPath else {
            movieUIImage.image = UIImage(systemName: "slowmo")
            return
        }
        movieUIImage.setImage(with: Constants.imageBaseUrl + path)
    }
}
