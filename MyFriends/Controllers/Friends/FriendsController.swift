//
//  ViewController.swift
//  MyFriends
//
//  Created by Valeria Chub on 11.02.2021.
//

import UIKit
import TableKit

class FriendsController: UIViewController, Storyboarded {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableDirector = TableDirector(tableView: tableView)
        }
    }
    
    // MARK: - Properties
    
    private var tableDirector: TableDirector!
    var viewModel: FriendsViewModel!
    weak var coordinator: FriendsCoordinator!
    
    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        bindFriendModels()
        bindLoading()
        viewModel.getFriendsData()
    }
    
    // MARK: - Methods
    
    private func setTableView(with friendModels: [FriendModel]) {
        
        tableDirector.clear()
        tableDirector += TableSection(rows: friendModels.map {
            let row = TableRow<FriendCell>(item: $0)
                .on(.select) { [weak self] options in
                    
                    options.cell?.setSelected(false, animated: true)
                    self?.coordinator.showFriendDetails(friendModel: options.item)
                }
            return row
        })
        tableDirector.reload()
    }
    
    private func bindFriendModels() {
        
        viewModel.bindFriendModels = { [weak self] friendModels in
            
            DispatchQueue.main.async { [weak self] in
                self?.setTableView(with: friendModels)
            }
        }
    }
    
    private func bindLoading() {
        
        loadingView.isHidden = true
        
        viewModel.bindLoading = { isLoading in
            
            DispatchQueue.main.async { [weak self] in
                
                if isLoading {
                    self?.loadingView.isHidden = false
                    self?.activityIndicator.startAnimating()
                } else {
                    self?.loadingView.isHidden = true
                    self?.activityIndicator.stopAnimating()
                }
            }
        }
    }
}

