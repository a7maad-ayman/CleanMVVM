import UIKit
import Kingfisher

extension UIImageView {
    func setImage(with stringUrl: String) {
        self.kf.indicatorType = .activity
        let url = URL(string: stringUrl)
        self.kf.setImage(with: url,
                         placeholder: UIImage(named: Constants.imagePlaceholder),
                         options: [.transition(.fade(0.3))])
    }
}
