import UIKit

class HomeViewController: UIViewController {
  
  //MARK: - IBOutlets
  @IBOutlet weak var homeCollectionView: UICollectionView!
  
  
  //MARK: - Properties
  private let viewModel = HomeViewModel()
  
  
  //MARK: Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    configureCollectionView()
    bindViewModelState()
    configureNavBar()
    view.backgroundColor = .systemGray4
    
  }
  override func viewWillAppear(_ animated: Bool) {
    viewModel.getMovies()
  }
  
  
  func configureCollectionView() {
    homeCollectionView.delegate = self
    homeCollectionView.dataSource = self
    homeCollectionView.register(HomeCollectionViewCell.self)
    
  }
  
  func bindViewModelState() {
    viewModel.reload = { [weak self] in
      DispatchQueue.main.async {
        self?.homeCollectionView.reloadData()
      }
    }
  }
  
  func configureNavBar() {
    let menu = UIMenu(title: "Filter", children: [
      UIAction(title: "Most Viewed", handler: { _ in
        // note [aziz]: move completion code to a separate method

        self.viewModel.getMovies(by: Constants.mostViewed)
        DispatchQueue.main.async {
          // note [aziz]: why reload here?, viewModel.reload already handles this
          self.homeCollectionView.reloadData()
        }            }),
      UIAction(title: "Popularity", handler: { _ in
        self.viewModel.getMovies(by: Constants.popularity)
        DispatchQueue.main.async {
          // note [aziz]: why reload here?, viewModel.reload already handles this
          self.homeCollectionView.reloadData()
        }            }),
    ])
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: nil, image: UIImage(systemName: "list.bullet"), primaryAction: nil, menu: menu)
    
  }
  
}

//MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    viewModel.numberOfRows
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell:HomeCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
    cell.set(movie: viewModel.getItem(at: indexPath.row))
    
    return cell
  }
  
  
}

//MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    // note [aziz]: use navigation router or coordinator to move navigation logic out of view controller
    guard let item = viewModel.getItem(at: indexPath.row) else { return }
    let viewModel = DetailsViewModel(movie: item)
    let viewController =  DetailsViewController(viewModel: viewModel)
    self.navigationController?.pushViewController(viewController, animated: true)
  }
}

//MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: self.view.frame.width/3 - 30, height: self.view.frame.height * 0.18)
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    let margin: CGFloat = 10
    return UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
  }
  
}
