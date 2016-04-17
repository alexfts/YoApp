//
//  ViewController.swift
//  YoApp
//
//  Created by Alexandra Fetisova on 2016-04-16.
//  Copyright © 2016 Alexandra Fetisova. All rights reserved.
//

import UIKit
import Contacts
import MessageUI

class ViewController: UIViewController, MFMessageComposeViewControllerDelegate {

    var name = " "
    var familyName = " "
    var phoneNumber = " "
    
    @IBOutlet weak var showFullName: UILabel!
    @IBOutlet weak var showCellPhoneNumber: UILabel!
    
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(updateWithContact), name: "displayContact", object: nil)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func sendYo(sender: UIButton) {
        let messageVC = MFMessageComposeViewController()
        messageVC.body = "YO"
        messageVC.recipients = [phoneNumber]
        messageVC.messageComposeDelegate = self
        self.presentViewController(messageVC, animated: false, completion: nil)
    }
    
    @IBAction func sendPizza(sender: UIButton) {
        let messageVC = MFMessageComposeViewController()
        messageVC.body = "Let's have a pizza!"
        messageVC.recipients = [phoneNumber]
        messageVC.messageComposeDelegate = self
        self.presentViewController(messageVC, animated: false, completion: nil)
    }
    
    @IBAction func sendDay(sender: UIButton) {
        let messageVC = MFMessageComposeViewController()
        messageVC.body = "How's your day?"
        messageVC.recipients = [phoneNumber]
        messageVC.messageComposeDelegate = self
        self.presentViewController(messageVC, animated: false, completion: nil)
    }
    
    
    func messageComposeViewController(controller: MFMessageComposeViewController, didFinishWithResult result: MessageComposeResult) {
        // yo
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

        showFullName.text = name + " " + familyName
        showCellPhoneNumber.text = phoneNumber
       // print(familyName, name, phoneNumber)
        
    }


}

