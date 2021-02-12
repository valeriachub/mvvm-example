//
//  FriendDetails.swift
//  MyFriends
//
//  Created by Valeria Chub on 11.02.2021.
//

import UIKit

class FriendDetailsController: UIViewController, Storyboarded {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var friendImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    
    // MARK: - Properties
    
    var viewModel: FriendDetailsViewModel!
    weak var coordinator: FriendsCoordinator!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    // MARK: - Methods
    
    private func updateUI() {
        
        nameLabel.text = "Name: \(viewModel.friendModel.name ?? "")"
        urlLabel.text = "Github: \(viewModel.friendModel.url ?? "")"
        friendImageView.kf.setImage(with: URL(string: viewModel.friendModel.image ?? ""))
    }
}
