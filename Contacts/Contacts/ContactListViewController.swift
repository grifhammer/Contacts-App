//
//  ContactListViewController.swift
//  Contacts
//
//  Created by Griffin Hammer on 11/9/15.
//  Copyright © 2015 Griffin Hammer. All rights reserved.
//

import UIKit

class ContactListViewController: UIViewController,
UITableViewDataSource, UITableViewDelegate, NewContactDelegate {
    
    
    var contacts : [Contact]?
    
    @IBOutlet weak var tableView: UITableView!
    @IBAction func importButtonTouched(sender: AnyObject) {
        let wsm = WebServiceManager()
        wsm.fetchContacts { (newContacts) -> Void in
        
            //Code in closure goes here
            for contact in newContacts {
                self.contacts?.append(contact)
            }
            DataManager.sharedManager.saveContacts(self.contacts!)
        }
    }
    
    @IBAction func refreshButtonTouched(sender: AnyObject) {
        self.tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.contacts?.count)!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //First get the contact for the row
        let contact = self.contacts![indexPath.row]
        
        let cell = UITableViewCell()
        
        cell.textLabel?.text = "\(contact.firstName!) \(contact.lastName!)"
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.contacts = DataManager.sharedManager.loadContacts()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        self.performSegueWithIdentifier("ContactDetailSegue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ContactDetailSegue" {
            if let selectedCell = self.tableView.indexPathForSelectedRow{
                let selectedContact = self.contacts![selectedCell.row]
                
                if let detailVC = segue.destinationViewController as? ContactsDetailViewController{
                    detailVC.selectedContact = selectedContact
                }
            }
        }
        else if segue.identifier == "NewContactSegue"{
            if let newContactVC = segue.destinationViewController as? NewContactViewController{
                newContactVC.delegate = self
            }
        }
    }
    
    func didCreateNewContact(newContact: Contact) {
        
        self.contacts?.append(newContact)
        
        DataManager.sharedManager.saveContacts(self.contacts!)
        
        self.tableView.reloadData()
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
