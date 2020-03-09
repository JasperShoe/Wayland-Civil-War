//
//  CrateViewController.swift
//  Wayland-Civil-War
//
//  Created by Alex_Kashian on 2/4/20.
//  Copyright © 2020 HACS. All rights reserved.
//

import UIKit
import Foundation


class CrateViewController: UIViewController {
    @IBOutlet weak var crateView: UIView?
    @IBOutlet weak var tapTap: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        crateView?.layer.cornerRadius = 30
        crateView?.layer.masksToBounds = true
        fadeViewInThenOut(view: tapTap, delay: 1)
       
        }
    
    func fadeViewInThenOut(view : UIView, delay: TimeInterval) {

    let animationDuration = 0.25

    // Fade in the view
        UIView.animate(withDuration: animationDuration, animations: { () -> Void in
        view.alpha = 1
        }) { (Bool) -> Void in

            // After the animation completes, fade out the view after a delay

            UIView.animate(withDuration: animationDuration, delay: delay, options: .curveEaseInOut, animations: { () -> Void in
                view.alpha = 0
                },
                completion: nil)
    
        }
    
    }
    
}
