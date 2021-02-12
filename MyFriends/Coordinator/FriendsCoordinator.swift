//
//  FriendsCoordinator.swift
//  MyFriends
//
//  Created by Valeria Chub on 12.02.2021.
//

import UIKit

class FriendsCoordinator: Coordinator {
    
    // MARK: - Properties
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    // MARK: - Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Methods
    
    func start() {
        let vc = FriendsController.instantiate(storyboard: R.storyboard.main())
        vc.coordinator = self
        vc.viewModel = FriendsViewModel()
        navigationController.setViewControllers([vc], animated: false)
    }
    
    func showFriendDetails(friendModel: FriendModel){
        let vc = FriendDetailsController.instantiate(storyboard: R.storyboard.main())
        vc.coordinator = self
        vc.viewModel = FriendDetailsViewModel(friendModel: friendModel)
        navigationController.pushViewController(vc, animated: true)
    }
}
