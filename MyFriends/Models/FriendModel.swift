//
//  Friend.swift
//  MyFriends
//
//  Created by Valeria Chub on 11.02.2021.
//

import Foundation

struct FriendsData: Codable {
    
    let data: [FriendModel]
}

struct FriendModel: Codable {
    
    let id: String
    let name: String
    let age: String
    let image: String
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case name = "employee_name"
        case age = "employee_age"
        case image = "profile_image"
    }
}
