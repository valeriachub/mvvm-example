//
//  SplashViewModel.swift
//  MyFriends
//
//  Created by Valeria Chub on 12.02.2021.
//

import Foundation

class SplashViewModel {
    
    // MARK: - Methods
 
    func getIsLogined(_ isUserLogined: @escaping (Bool) -> Void) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            
            let isLogined = DatabaseService.getInstance.getIsLogined()
            isUserLogined(isLogined)
        }
    }
}
