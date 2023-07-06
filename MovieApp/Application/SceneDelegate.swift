import UIKit

//TODO: note [aziz]: why depend on scene delegate not app delegate
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    
    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = createTabBar()
        window?.makeKeyAndVisible()
    }
    
    func createHomeNC() -> UINavigationController {
            let homeVC = HomeViewController()
        homeVC.title = "Home"
        homeVC.tabBarItem = UITabBarItem(tabBarSystemItem:.recents, tag: 0)
            
            return UINavigationController(rootViewController: homeVC)
        }
        
        func createFavoritesNC() -> UINavigationController {
            let favoritesVC = FavoritesViewController()
            favoritesVC.title = "Favorites"
            favoritesVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
            
            return UINavigationController(rootViewController: favoritesVC)
        }
    
    
    func createTabBar() -> UITabBarController {
            let tabbar = UITabBarController()
            UITabBar.appearance().tintColor = .systemGreen
            UITabBar.appearance().backgroundColor = .systemGray4
            tabbar.viewControllers = [createHomeNC(),createFavoritesNC()]
            return tabbar
        }

}

