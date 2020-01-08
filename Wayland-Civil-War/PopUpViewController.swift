//
//  PopUpViewController.swift
//  Wayland-Civil-War
//
//  Created by Alex_Kashian on 12/25/19.
//  Copyright © 2019 HACS. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {
    
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var CancelButton: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popupView.layer.cornerRadius = 40
        popupView.layer.masksToBounds = true

    }
    


    @IBAction func CancelPurchase(_ sender: Any) {
        self.view.removeFromSuperview()
        CancelButton.shake()
    }
    
}
