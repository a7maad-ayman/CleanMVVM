import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    //MARK: - Properties
    private let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray4
        viewModel.showMovies()
        print("\(viewModel.movies?.results?.count)")
    }
}

