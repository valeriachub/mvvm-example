//
//  LoginController.swift
//  MyFriends
//
//  Created by Valeria Chub on 12.02.2021.
//

import UIKit

class LoginController: UIViewController, Storyboarded {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Properties
    
    weak var coordinator: MainCoordinator!
    var viewModel: LoginViewModel!
    
    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        bindLoading()
    }
    
    // MARK: - Methods
    
    private func bindLoading() {
        
        loadingView.isHidden = true
        
        viewModel.bindLoading = { [weak self] isLoading in
            
            if isLoading {
                self?.loadingView.isHidden = false
                self?.activityIndicator.startAnimating()
            } else {
                self?.loadingView.isHidden = true
                self?.activityIndicator.stopAnimating()
            }
        }
    }
    
    // MARK: - IBAction
    
    @IBAction func loginAction(_ sender: UIButton) {
        
        let login = loginTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        viewModel.loginAction(login: login, password: password) { [weak self] in
            self?.coordinator.showFriendsList()
            
        } loginError: { loginError in
            print(loginError.description)
        }
    }
}
