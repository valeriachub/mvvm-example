//
//  FriendsRouter.swift
//  MyFriends
//
//  Created by Valeria Chub on 11.02.2021.
//

import UIKit

class FriendsRouter: Router {
    
    func route(to routeId: String, from context: UIViewController, params: Any?) {
        
        guard let route = Route(rawValue: routeId) else {
            return
        }
        
        switch route {
        case .friendDetails:
            
            guard let friendModel = params as? FriendModel else {
                return
            }
            
            let vc = R.storyboard.main.friendDetailsController()!
            let vm = FriendDetailsViewModel(friendModel: friendModel)
            vc.setViewModel(vm)
            context.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
