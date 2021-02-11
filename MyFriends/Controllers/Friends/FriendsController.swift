//
//  ViewController.swift
//  MyFriends
//
//  Created by Valeria Chub on 11.02.2021.
//

import UIKit
import TableKit

class FriendsController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableDirector = TableDirector(tableView: tableView)
        }
    }
    
    // MARK: - Properties
    
    private var tableDirector: TableDirector!
    private var friendsViewModel: FriendsViewModel!
    private var router: Router!
        
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        router = FriendsRouter()
        updateUI()
    }

    // MARK: - Methods
    
    private func setTableView(with friendModels: [FriendModel]) {
        
        tableDirector.clear()
        tableDirector += TableSection(rows: friendModels.map {
            let row = TableRow<FriendCell>(item: $0)
               .on(.select) { [weak self] options in
                guard let self = self else {
                    return
                }
                options.cell?.setSelected(false, animated: true)
                self.router.route(to: Route.friendDetails.rawValue, from: self, params: options.item)
            }
            return row
        })
        tableDirector.reload()
    }
    
    private func updateUI() {
        
        friendsViewModel = FriendsViewModel()
        friendsViewModel.bind = { [weak self] friendModels in
            DispatchQueue.main.async { [weak self] in
                self?.setTableView(with: friendModels)
            }
        }
    }
}

