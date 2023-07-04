import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    //MARK: - Properties
    private let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray4
        configureCollectionView()
        configureOnReloadData()
        
    }
    
    
    private func configureCollectionView() {
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        homeCollectionView.register(HomeCollectionViewCell.self)
    }
    
    
    private func configureOnReloadData() {
        viewModel.configureOnReloadNeeded {
            DispatchQueue.main.async {
                self.homeCollectionView.reloadData()
            }
        }

//        viewModel.configureOnSelectImage { [weak self] image in
//            guard let self else {
//                return
//            }
//
//            let viewController = self.storyboard?.instantiateViewController(withIdentifier: "detalis") as! UIViewController
//            viewController.imageUrl = image.urls?.regular ?? ""
//            self.navigationController?.pushViewController(viewController, animated: true)
//        }

        viewModel.getMovies()
    }
}

//MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = homeCollectionView.dequeueReusableCell(for: indexPath) as! HomeCollectionViewCell
        
       cell.set(movie: viewModel.allMovies[indexPath.row])
       // cell.movieUIImage.image = UIImage(systemName: "home")
        
        return cell
    }
    
    
}

//MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    
}

//MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
}
