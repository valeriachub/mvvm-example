//
//  FriendDetails.swift
//  MyFriends
//
//  Created by Valeria Chub on 11.02.2021.
//

import UIKit

class FriendDetailsController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var friendImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    
    // MARK: - Properties
    
    private var friendDetailsViewModel: FriendDetailsViewModel!
    private var router: Router?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    // MARK: - Methods
    
    func setViewModel(_ viewModel: FriendDetailsViewModel) {
        
        friendDetailsViewModel = viewModel
    }
    
    private func updateUI() {
        
        nameLabel.text = "Name: \(friendDetailsViewModel.friendModel.name ?? "")"
        urlLabel.text = "Github: \(friendDetailsViewModel.friendModel.url ?? "")"
        friendImageView.kf.setImage(with: URL(string: friendDetailsViewModel.friendModel.image ?? ""))
    }
}
