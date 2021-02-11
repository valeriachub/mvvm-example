//
//  ViewControllerEvent.swift
//  MyFriends
//
//  Created by Valeria Chub on 11.02.2021.
//

import Foundation

enum Event {
    
    case viewWillAppear
}

protocol ViewControllerEvent {
    
    func sendEvent(_ event: Event)
}
