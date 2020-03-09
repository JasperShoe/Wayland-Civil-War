//
//  SettingsViewController.swift
//  Wayland-Civil-War
//
//  Created by Alex_Kashian on 1/29/20.
//  Copyright © 2020 HACS. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var terms: UIButton!
    @IBOutlet weak var privacy: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var notification: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        terms.layer.borderWidth = 1
        terms.layer.cornerRadius = 20
        self.terms.backgroundColor = UIColor.blue
        terms.clipsToBounds = true

        
        privacy.layer.borderWidth = 1
        privacy.layer.cornerRadius = 20
        self.privacy.backgroundColor = UIColor.blue
        privacy.clipsToBounds = true
        
        cancelButton.layer.borderColor = UIColor.black.cgColor
        cancelButton.tintColor = .red
        cancelButton.layer.cornerRadius = 10
        cancelButton.clipsToBounds = true
        
        notification.layer.borderWidth = 2.0
        notification.layer.borderColor = UIColor.black.cgColor
        notification.layer.cornerRadius = 20
        self.notification.backgroundColor = UIColor.green
        cancelButton.clipsToBounds = true


        
    }
 
    @IBAction func Cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func TermsOfService(_ sender: Any) {
        UIApplication.shared.openURL(NSURL(string: "https://nationalpostcom.files.wordpress.com/2019/06/flip-2.png?w=780")! as URL)
        
    }
    @IBAction func PrivacyPolicy(_ sender: Any) {
        UIApplication.shared.openURL(NSURL(string: "https://external-preview.redd.it/p1WxH9Slz9QIPTsThD7Gjm3ZGtVxOc1wF4eZS8X7M8A.jpg?auto=webp&s=8f80d5f27635f48c321aec701675c1b0e6e468c5")! as URL)
    }
    
}
