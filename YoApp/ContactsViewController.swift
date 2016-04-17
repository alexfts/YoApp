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

   /* private let store = CNContactStore()
    
    private func fetchContacts() {
        let request = CNContactFetchRequest(keysToFetch: [CNContactGivenNameKey, CNContactFamilyNameKey,CNContactPhoneNumbersKey])
        
        do {
            try store.enumerateContactsWithFetchRequest(request) {
                contact, stop in
                print(contact.givenName)
                print(contact.familyName)
                print(contact.identifier)
                print(contact.phoneNumbers)
            }
        } catch let err{
            print(err)
        }
    }*/
    
    func addExistingContact() {
        let contactPicker = CNContactPickerViewController()
        contactPicker.delegate = self
        self.presentViewController(contactPicker, animated: true, completion: nil)
    }
    
    func contactPicker(picker: CNContactPickerViewController, didSelectContact contact: CNContact) {
        
        NSNotificationCenter.defaultCenter().postNotificationName("displayContact", object: nil, userInfo: ["contact": contact])
        // take us to the ViewController
    }
    
    @IBAction func click(sender: UIButton) {
        addExistingContact()
        self.performSegueWithIdentifier("show_detail", sender: nil)
    }
    
    


}
