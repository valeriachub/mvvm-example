//
//  APIService.swift
//  MyFriends
//
//  Created by Valeria Chub on 11.02.2021.
//

import Foundation

class APIService {
    
    // MARK: - Properies
    
    private let friendsURL = URL(string: "http://dummy.restapiexample.com/api/v1/employees")!
    
    // MARK: - Methods
    
    func getFriendsData(success: @escaping([FriendModel]) -> Void, failure: @escaping(String) -> Void) {
        URLSession.shared.dataTask(with: friendsURL) { data, urlResponse, error in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                if let friendsData = try? jsonDecoder.decode(FriendsData.self, from: data) {
                    success(friendsData.data)
                } else {
                    failure("Error parsing FriendsData");
                }
            } else {
                failure("Error getting FriendsData");
            }
        }.resume()
    }
}
