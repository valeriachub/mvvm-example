//
//  MainCoordinator.swift
//  MyFriends
//
//  Created by Valeria Chub on 12.02.2021.
//

import UIKit

class MainCoordinator: Coordinator {
    
    // MARK: - Properties
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    // MARK: - Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Methods
    
    func start() {
        let vc = SplashController.instantiate(storyboard: R.storyboard.login())
        vc.viewModel = SplashViewModel()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func show(isLogined: Bool) {
        if isLogined {
            showFriendsList()
            
        } else {
            let vc = LoginController.instantiate(storyboard: R.storyboard.login())
            vc.coordinator = self
            vc.viewModel = LoginViewModel()
            navigationController.pushViewController(vc, animated: false)
        }
    }
    
    func showFriendsList() {
        let friendsCoordinator = FriendsCoordinator(navigationController: navigationController)
        childCoordinators.append(friendsCoordinator)
        friendsCoordinator.start()
    }
}
