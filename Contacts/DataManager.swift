//
//  DataManager.swift
//  Contacts
//
//  Created by Griffin Hammer on 11/9/15.
//  Copyright © 2015 Griffin Hammer. All rights reserved.
//

import Foundation


struct DataManager {
    static let sharedManager = DataManager()
    
    func loadContacts() -> [Contact]? {
        
        let destinationPath = self.filePathForArchiving()
        
        if let contacts : [Contact] = NSKeyedUnarchiver.unarchiveObjectWithFile(destinationPath) as? [Contact]{
            return contacts
        }
        return [Contact]()
        
    }
    
    func saveContacts(contacts:[Contact]) {
        
        let destinationPath = self.filePathForArchiving()
        NSKeyedArchiver.archiveRootObject(contacts, toFile: destinationPath)
        
    }
    
    private func filePathForArchiving() -> String {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        let destinationPath = "\(documentsPath)/SavedContacts"
        return destinationPath
    }
}