//
//  FriendDetailsViewModel.swift
//  MyFriends
//
//  Created by Valeria Chub on 11.02.2021.
//

import Foundation

class FriendDetailsViewModel {
    
    // MARK: - Properties
    
    private(set) var friendModel: FriendModel!
    
    // MARK: - Init
    
    init(friendModel: FriendModel) {
        
        self.friendModel = friendModel
    }
}
