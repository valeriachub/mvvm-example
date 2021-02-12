//
//  Coordinator.swift
//  MyFriends
//
//  Created by Valeria Chub on 12.02.2021.
//

import UIKit

protocol Coordinator {
    
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
