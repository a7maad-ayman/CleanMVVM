//
//  AppCoordinator.swift
//  MovieApp
//
//  Created by ahmad on 06/07/2023.
//

import UIKit
class AppCoordinator: Coordinator {
 
    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let rootViewController = HomeViewController()
        let navigationController = UINavigationController(rootViewController: rootViewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }

  func navigateTo(_ viewController:UIViewController) {
        let viewController = viewController
        window.rootViewController?.navigationController?.pushViewController(viewController, animated: true)
    }
}
