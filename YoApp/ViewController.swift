//
//  ViewController.swift
//  YoApp
//
//  Created by Alexandra Fetisova on 2016-04-16.
//  Copyright © 2016 Alexandra Fetisova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var name = " "
    var familyName = " "
    var phoneNumber = ""
    
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
    
    func updateWithContact(notification: NSNotification?) {
        print(notification?.userInfo?["contact"]!)
    }


}

