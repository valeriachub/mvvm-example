//
//  Friend.swift
//  MyFriends
//
//  Created by Valeria Chub on 11.02.2021.
//

import Foundation

struct FriendModel: Codable {
    
    let id: Int
    let name: String?
    let image: String?
    let url: String?
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case name = "login"
        case image = "avatar_url"
        case url
    }
}
