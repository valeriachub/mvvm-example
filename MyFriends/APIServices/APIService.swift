//
//  APIService.swift
//  MyFriends
//
//  Created by Valeria Chub on 11.02.2021.
//

import Foundation

class APIService {
    
    // MARK: - Properies
    
    private let friendsURL = URL(string: "https://api.github.com/users")!
    
    // MARK: - Methods
    
    func getFriendsData(success: @escaping([FriendModel]) -> Void, failure: @escaping(String) -> Void) {
        URLSession.shared.dataTask(with: friendsURL) { data, urlResponse, error in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                if let friendsData = try? jsonDecoder.decode([FriendModel].self, from: data) {
                    success(friendsData)
                } else {
                    failure("Error parsing FriendsData");
                }
            } else {
                failure("Error getting FriendsData");
            }
        }.resume()
    }
}
