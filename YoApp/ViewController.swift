//
//  ViewController.swift
//  YoApp
//
//  Created by Alexandra Fetisova on 2016-04-16.
//  Copyright © 2016 Alexandra Fetisova. All rights reserved.
//

import UIKit
import Contacts

class ViewController: UIViewController {
    var name = " "
    var familyName = " "
    var phoneNumber = " "
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateWithContact(notification: NSNotification?) {
        name = " "
        familyName = " "
        phoneNumber = " "
        var tempContact = CNContact()
        
        tempContact = (notification?.userInfo?["contact"]!)! as! CNContact
        let phoneNumbers = tempContact.phoneNumbers
        
        name = tempContact.givenName
        familyName = tempContact.familyName
        
        for number in phoneNumbers {
            print(number.label)
            if number.label == "_$!<Mobile>!$_" {
                let temp = number.value as! CNPhoneNumber
                phoneNumber = temp.stringValue
            }
        }
        
       // print(familyName, name, phoneNumber)
        
    }


}

