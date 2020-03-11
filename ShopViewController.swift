//
//  ShopViewController.swift
//  Wayland-Civil-War
//
//  Created by Alex_Kashian on 1/22/20.
//  Copyright © 2020 HACS. All rights reserved.
//

import UIKit

class ShopViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "firstSegue" {

            if let destinationVC = segue.destination as? PopUpViewController {
                destinationVC.myimage = UIImage(named: "FlagRed.png")!
            }
        }
        else if segue.identifier == "secondSegue" {

            if let destinationVC = segue.destination as? PopUpViewController {
                destinationVC.myimage = UIImage(named: "FlagPurple.png")!
            }
        }
        
        else if segue.identifier == "thirdSegue" {

                   if let destinationVC = segue.destination as? PopUpViewController {
                       destinationVC.myimage = UIImage(named: "FlagGold.png")!
                   }
               }

    }


}
