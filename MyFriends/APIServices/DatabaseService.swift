//
//  DatabaseService.swift
//  MyFriends
//
//  Created by Valeria Chub on 12.02.2021.
//

import Foundation

class DatabaseService {
    
    // MARK: - Properties
    
    private let isLogined = "isLogined"
    
    static private var instance: DatabaseService!
    
    static var getInstance: DatabaseService {
        if instance == nil {
            instance = DatabaseService()
        }
        
        return instance
    }
    
    // MARK: - Methods
    
    func getIsLogined() -> Bool {
        
        return UserDefaults.standard.bool(forKey: isLogined)
    }
    
    func setIsLogined(_ isLogined: Bool) {
        
        UserDefaults.standard.setValue(isLogined, forKey: self.isLogined)
    }
    
}
