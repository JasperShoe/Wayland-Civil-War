//
//  PopUpViewController.swift
//  Wayland-Civil-War
//
//  Created by Alex_Kashian on 12/25/19.
//  Copyright © 2019 HACS. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {
    
    
    @IBOutlet weak var popUpView: UIView?
    
    @IBOutlet weak var popUpImage: UIImageView?
    
    @IBOutlet weak var CancelButton: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popUpView?.layer.cornerRadius = 40
        popUpView?.layer.masksToBounds = true
    }
    

    @IBAction func CancelPurchase(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        CancelButton.shake()
    }
    
   
    var myimage = UIImage()
    override func viewWillAppear(_ animated: Bool) {
        self.popUpImage?.image = myimage
    }

}
    

