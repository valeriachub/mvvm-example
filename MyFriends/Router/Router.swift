//
//  Router.swift
//  MyFriends
//
//  Created by Valeria Chub on 11.02.2021.
//

import UIKit

protocol Router {
    
    func route(to routeId: String, from context: UIViewController, params: Any?)
}

enum Route: String {
    case friendDetails
}


