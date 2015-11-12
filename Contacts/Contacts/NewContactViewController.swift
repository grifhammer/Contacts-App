//
//  NewContactViewController.swift
//  Contacts
//
//  Created by Griffin Hammer on 11/11/15.
//  Copyright © 2015 Griffin Hammer. All rights reserved.
//

import UIKit

class NewContactViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var streetAddressTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var zipCodeTextField: UITextField!
    
    var delegate : NewContactDelegate?
    
    @IBAction func saveButtonTouched(sender: AnyObject) {
        if self.delegate != nil {
            
            let newContact = Contact()
            
            newContact.firstName = self.firstNameTextField.text
            newContact.lastName = self.lastNameTextField.text
            newContact.phoneNumber = self.phoneNumberTextField.text
            newContact.streetAddress = self.streetAddressTextField.text
            newContact.city = self.cityTextField.text
            newContact.state = self.stateTextField.text
            newContact.zipCode = self.zipCodeTextField.text
            
            self.delegate!.didCreateNewContact(newContact)
            
        }
        self.navigationController?.popViewControllerAnimated(true)

    }
    
    
        override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
