//
//  SplashController.swift
//  MyFriends
//
//  Created by Valeria Chub on 12.02.2021.
//

import UIKit

class SplashController: UIViewController, Storyboarded {
    
    // MARK: - Properties
    
    var viewModel: SplashViewModel!
    weak var coordinator: MainCoordinator?
    
    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        viewModel.getIsLogined { [weak self] isUserLogined in
            self?.coordinator?.show(isLogined: isUserLogined)
        }
    }
}
