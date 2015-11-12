//
//  Contact.swift
//  Contacts
//
//  Created by Griffin Hammer on 11/9/15.
//  Copyright © 2015 Griffin Hammer. All rights reserved.
//

import Foundation



class Contact : NSObject, NSCoding {
    var firstName : String?
    var lastName : String?
    var phoneNumber : String?
    var streetAddress : String?
    var city : String?
    var state : String?
    var zipCode : String?
    
    @objc required init?(coder aDecoder:NSCoder) {
        self.firstName = aDecoder.decodeObjectForKey("firstName") as? String
        self.lastName = aDecoder.decodeObjectForKey("lastName") as? String
        self.phoneNumber = aDecoder.decodeObjectForKey("phoneNumber") as? String
        self.streetAddress = aDecoder.decodeObjectForKey("streetAddress") as? String
        self.city = aDecoder.decodeObjectForKey("city") as? String
        self.state = aDecoder.decodeObjectForKey("state") as? String
        self.zipCode = aDecoder.decodeObjectForKey("zip") as? String
    }
    
    override init(){
        super.init()
    }
    
    @objc func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.firstName, forKey: "firstName")
        aCoder.encodeObject(self.lastName, forKey: "lastName")
        aCoder.encodeObject(self.phoneNumber, forKey: "phoneNumber")
        aCoder.encodeObject(self.streetAddress, forKey: "streetAddress")
        aCoder.encodeObject(self.city, forKey: "city")
        aCoder.encodeObject(self.state, forKey: "state")
        aCoder.encodeObject(self.zipCode, forKey: "zip")
    }
    
    
    
    
    
    
}
