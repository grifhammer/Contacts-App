//
//  NewContactDelegate.swift
//  Contacts
//
//  Created by Griffin Hammer on 11/11/15.
//  Copyright © 2015 Griffin Hammer. All rights reserved.
//

import Foundation


protocol NewContactDelegate : class {
    
    func didCreateNewContact(newContact:Contact)
    
    
}