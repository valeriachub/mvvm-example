//
//  FriendCell.swift
//  MyFriends
//
//  Created by Valeria Chub on 11.02.2021.
//

import UIKit
import TableKit

class FriendCell: UITableViewCell, ConfigurableCell {
    
    typealias CellData = FriendModel
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var friendImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    // MARK: - Properties
    
    private var friendModel: FriendModel!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Methods

    func configure(with friendModel: FriendModel) {
        
        
            nameLabel.text = "Name: \(friendModel.name)"
            ageLabel.text = "Age: \(friendModel.age)"
        
    }
}
