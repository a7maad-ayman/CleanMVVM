import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    //MARK: - Properties
    private let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureOnReloadData()
        view.backgroundColor = .systemGray4
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        homeCollectionView.reloadData()
    }
    
    
     func configureCollectionView() {
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
         homeCollectionView.register(HomeCollectionViewCell.self)

    }
    
    
     func configureOnReloadData() {
        viewModel.configureOnReloadNeeded {
            DispatchQueue.main.async {
                self.homeCollectionView.reloadData()
            }
        }
        viewModel.getMovies()
    }
}

//MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfRows()
        //return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell:HomeCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
//
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell


        
        
        cell.set(movie: viewModel.allMovies[indexPath.row])
       // cell.movieUIImage.image = UIImage(systemName: "home")
        
        return cell
    }
    
    
}

//MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController =  DetailsViewController()
        self.present(viewController, animated:true, completion:nil)
    }
}

//MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: self.view.frame.width/3 - 30, height: self.view.frame.height * 0.18)
        }
}
