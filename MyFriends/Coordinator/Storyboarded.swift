//
//  Storyboarded.swift
//  MyFriends
//
//  Created by Valeria Chub on 12.02.2021.
//

import UIKit

protocol Storyboarded {
    
    static func instantiate(storyboard: UIStoryboard) -> Self
}

extension Storyboarded where Self: UIViewController {
    
    static func instantiate(storyboard: UIStoryboard) -> Self {
        
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
