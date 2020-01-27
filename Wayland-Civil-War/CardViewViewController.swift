//
//  CardViewViewController.swift
//  Wayland-Civil-War
//
//  Created by Alex_Kashian on 1/22/20.
//  Copyright © 2020 HACS. All rights reserved.
//

import UIKit

class CardViewViewController: UIViewController {

    @IBOutlet weak var cancelButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cancelButton.layer.borderColor = UIColor.black.cgColor
        cancelButton.tintColor = .red
        cancelButton.layer.cornerRadius = 10
        cancelButton.clipsToBounds = true
        
    }
    
    @IBAction func Cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
