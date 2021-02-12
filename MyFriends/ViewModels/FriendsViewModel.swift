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
            bindFriendModels?(friendModels)
        }
    }
    var bindFriendModels: (([FriendModel]) -> ())?
    
    private(set) var loading: Bool = false {
        didSet {
            bindLoading?(loading)
        }
    }
    
    var bindLoading: ((Bool) -> ())?
    
    // MARK: - Init
    
    init(apiService: APIService = APIService()) {
        self.apiServise = apiService
    }
    
    // MARK: - Methods
    
    func getFriendsData() {
        
        loading = true
        
        apiServise.getFriendsData { [weak self] friendModels in
            
            self?.loading = false
            self?.friendModels = friendModels
            
        } failure: { [weak self] error in
            
            self?.loading = false
            print(error)
        }
    }
}
