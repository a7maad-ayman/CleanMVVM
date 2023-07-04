import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var movieUIImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        movieUIImage.layer.cornerRadius = 10
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        movieUIImage.image = nil
    }
    
    
    func set(movie: Movie){
        movieUIImage.setImage(with: "http://image.tmdb.org/t/p/w185//ghBTtkCpbeHqad52ytv0aSs5FFi.jpg")
    }
}
