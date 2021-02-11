//
//  FriendsViewModel.swift
//  MyFriends
//
//  Created by Valeria Chub on 11.02.2021.
//

import Foundation

class FriendsViewModel {
    
    // MARK: - Properties
    
    private var apiServise: APIService!
    private(set) var friendModels = [FriendModel]() {
        didSet {
            bind?(friendModels)
        }
    }
    var bind: (([FriendModel]) -> ())?
    
    // MARK: - Init
    
    init() {
        apiServise = APIService()
    }
    
    // MARK: - Methods
    
    private func getFriendsData() {
        
        apiServise.getFriendsData { [weak self] friendModels in
            
            self?.friendModels = friendModels.filter({ friendModel in
                return Int(friendModel.age) ?? 0 < 40
            })
            
        } failure: { error in
            print(error)
        }
    }
}

// MARK: - Extension ViewControllerEvent

extension FriendsViewModel: ViewControllerEvent {
    
    func sendEvent(_ event: Event) {
        switch event {
        case .viewWillAppear:
            getFriendsData()
        }
    }
}
