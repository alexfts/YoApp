//
//  ContactsViewController.swift
//  YoApp
//
//  Created by Alexandra Fetisova on 2016-04-16.
//  Copyright © 2016 Alexandra Fetisova. All rights reserved.
//

import UIKit
import Contacts
import ContactsUI

class ContactsViewController: UIViewController, CNContactPickerDelegate {
    
    func addExistingContact() {
        let contactPicker = CNContactPickerViewController()
        contactPicker.delegate = self
        self.presentViewController(contactPicker, animated: true, completion: nil)
    }
    
    func contactPicker(picker: CNContactPickerViewController, didSelectContact contact: CNContact) {
        // send contact to the new window
        //NSNotificationCenter.defaultCenter().postNotificationName("addNewContact", object: nil, userInfo: ["contactToAdd": contact])
    }
    
    @IBAction func click(sender: UIButton) {
        addExistingContact()
    }


}
