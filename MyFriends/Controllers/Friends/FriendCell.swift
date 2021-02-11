//
//  FriendCell.swift
//  MyFriends
//
//  Created by Valeria Chub on 11.02.2021.
//

import UIKit
import TableKit
import Kingfisher

class FriendCell: UITableViewCell, ConfigurableCell {
    
    typealias CellData = FriendModel
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var friendImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Methods
    
    func configure(with friendModel: FriendModel) {
        
        nameLabel.text = "Name: \(friendModel.name ?? "")"
        urlLabel.text = "Github: \(friendModel.url ?? "")"
        friendImageView.kf.setImage(with: URL(string: friendModel.image ?? ""))
    }
}
