//
//  NotificationSettingsViewController.swift
//  Wayland-Civil-War
//
//  Created by Alex_Kashian on 2/10/20.
//  Copyright © 2020 HACS. All rights reserved.
//

import UIKit

class NotificationSettingsViewController: UIViewController {
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var notificationView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cancelButton.layer.borderColor = UIColor.black.cgColor
        cancelButton.tintColor = .red
        cancelButton.layer.cornerRadius = 10
        cancelButton.clipsToBounds = true
        notificationView.layer.cornerRadius = 20
        notificationView.layer.masksToBounds = true
        
        

    }
    
    @IBAction func Cancel(_ sender: Any) {
         dismiss(animated: true, completion: nil)
    }
    
    
}
