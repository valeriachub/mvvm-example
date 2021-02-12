//
//  LoginViewModel.swift
//  MyFriends
//
//  Created by Valeria Chub on 12.02.2021.
//

import Foundation

class LoginViewModel {
    
    enum LoginError {
        case emptyFields
        case wrongLoginPassword
        
        var description: String {
            switch self {
            case .emptyFields:
                return "Please fill all the fields"
            case .wrongLoginPassword:
                return "Wrong login or password"
            }
        }
    }
    
    // MARK: - Properties
    
    private(set) var loading: Bool = false {
        didSet {
            bindLoading?(loading)
        }
    }
    
    var bindLoading: ((Bool) -> ())?
    
    // MARK: - Actions
    
    func loginAction(login: String, password: String, success: @escaping (() -> Void), loginError: @escaping ((LoginError) -> Void)) {
        
        if login.isEmpty || password.isEmpty {
            loginError(.emptyFields)
            return
            
        } else if password != "123456" || login != "test@test.com" {
            loginError(.wrongLoginPassword)
            return
        }
        
        loading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: { [weak self] in
            
            self?.loading = false
            
            DatabaseService.getInstance.setIsLogined(true)
            success()
        })
    }
}
